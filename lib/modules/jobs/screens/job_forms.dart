import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/modules/jobs/models/job_form_item.dart';
import 'package:tech2/modules/jobs/services/jobs_service.dart';

class JobFormsScreen extends StatefulWidget {
  final int jobVisitId;

  const JobFormsScreen({Key? key, required this.jobVisitId}) : super(key: key);

  @override
  State<JobFormsScreen> createState() => _JobFormsScreenState();
}

class _JobFormsScreenState extends State<JobFormsScreen> {
  List<JobFormDto>? formsList;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    loadJobFormsList();
  }

  loadJobFormsList() {
    setState(() => loading = true);
    JobsService.getJobForms(widget.jobVisitId)
        .then((List<JobFormDto> data) => setState(() => formsList = data))
        .whenComplete(() => setState(() => loading = false));
  }

  onSelectForm(int index) {
    FormDetailInput formInput = FormDetailInput(
        formId: formsList![index].formId,
        formResponseId: formsList![index].formResponseId,
        formName: formsList![index].formName,
        jobVisitId: widget.jobVisitId);
    Navigator.pushNamed(context, '/form-details', arguments: formInput)
        .then((_) => loadJobFormsList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms List'),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: RadialGradient(radius: 1, colors: [
          Colors.black87,
          Colors.black,
        ], stops: [
          0.1,
          10
        ])),
        child: !loading && formsList != null
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: formsList!.length,
                itemBuilder: (_, index) => InkWell(
                      onTap: () => onSelectForm(index),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...formsList![index].mandatory
                                  ? const [
                                      Text(
                                        'MANDATORY',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 10),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ]
                                  : [],
                              Text(
                                formsList![index].formName,
                                style: const TextStyle(fontSize: 16),
                              ),
                              ...formsList![index].formDesc != null
                                  ? [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        formsList![index].formDesc!,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ]
                                  : []
                            ],
                          ),
                        ),
                      ),
                    ))
            : Center(
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: SizedBox.expand(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}