import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/modules/jobs/services/forms_service.dart';
import 'package:tech2/modules/jobs/widgets/form_text_field.dart';

class FormDetailsScreen extends StatefulWidget {
  final FormDetailInput formDetailsInput;

  const FormDetailsScreen({Key? key, required this.formDetailsInput})
      : super(key: key);

  @override
  State<FormDetailsScreen> createState() => _FormDetailsScreenState();
}

class _FormDetailsScreenState extends State<FormDetailsScreen> {
  FormResponseModelDto? model;

  @override
  void initState() {
    super.initState();

    loadFormResponse();
  }

  loadFormResponse() {
    FormsService.getFormResponseModel(widget.formDetailsInput.formId,
            widget.formDetailsInput.formResponseId)
        .then((data) => setState(() => model = data));
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.formDetailsInput.formName),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: model != null
              ? model!.isWizard
                  ? Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: screenHeight,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                          ),
                          items: model!.listOfFields
                              .map((field) => TextFormField())
                              .toList(),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: FloatingActionButton.extended(
                              label: Row(
                                children: const [
                                  Text('next'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(Icons.arrow_forward)
                                ],
                              ),
                              onPressed: () {},
                            )),
                        Positioned(
                            bottom: 10,
                            left: 10,
                            child: FloatingActionButton.extended(
                              label: const Text('prev'),
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {},
                            )),
                      ],
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: model!.listOfFields.length,
                      itemBuilder: (_, index) {
                        switch (model!.listOfFields[index].type) {
                          case 'Input':
                            return FormTextField(
                                fieldModel: model!.listOfFields[index]);
                        }
                        return Container();
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
        ),
      ),
    );
  }
}
