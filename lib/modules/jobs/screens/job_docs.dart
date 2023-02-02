import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/docs.dart';
import 'package:tech2/modules/jobs/services/docs_service.dart';

class JobDocuments extends StatefulWidget {
  final int jobId;

  const JobDocuments({Key? key, required this.jobId}) : super(key: key);

  @override
  State<JobDocuments> createState() => _JobDocumentsState();
}

class _JobDocumentsState extends State<JobDocuments> {
  List<LinkedDocumentDto>? docsList;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    loadDocsList();
  }

  loadDocsList() {
    setState(() => loading = true);
    DocsService.getListOfLinkedDocumentAndFormResponse(widget.jobId, 'Job')
        .then((value) => setState(() => docsList = value))
        .whenComplete(() => setState(() => loading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Docs'),
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
          child: !loading && docsList != null
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: docsList!.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          visualDensity:
                              const VisualDensity(horizontal: 1, vertical: 2),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor),
                            child: const Icon(Icons.file_copy,
                                color: Colors.white),
                          ),
                          title: Text(
                            docsList![index].docFileName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          subtitle: Text(
                            docsList![index].docDescription,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 12),
                          ),
                        ),
                        const Divider(
                          color: Colors.white24,
                          height: 1,
                        )
                      ],
                    );
                  })
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
        ));
  }
}
