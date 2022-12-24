import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/modules/jobs/services/forms_service.dart';
import 'package:tech2/modules/jobs/widgets/form_text_field.dart';
import 'package:tech2/modules/jobs/widgets/form_date_field.dart';
import 'package:tech2/modules/jobs/widgets/form_number_field.dart';
import 'package:tech2/modules/jobs/widgets/form_select_field.dart';

class FormDetailsScreen extends StatefulWidget {
  final FormDetailInput formDetailsInput;

  const FormDetailsScreen({Key? key, required this.formDetailsInput})
      : super(key: key);

  @override
  State<FormDetailsScreen> createState() => _FormDetailsScreenState();
}

class _FormDetailsScreenState extends State<FormDetailsScreen> {
  FormResponseModelDto? model;
  int currentIndex = 0;

  CarouselController sliderController = CarouselController();

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

  goPrevSlide() {
    if (currentIndex > 0) {
      sliderController.previousPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      setState(() {
        currentIndex--;
      });
    }
  }

  goNextSlide() {
    if (currentIndex < model!.listOfFields.length) {
      sliderController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      setState(() {
        currentIndex++;
      });
    }
  }

  handleOnPageChanged(index, _) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
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
                          carouselController: sliderController,
                          options: CarouselOptions(
                              autoPlay: false,
                              height: screenHeight,
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              enableInfiniteScroll: false,
                              scrollPhysics:
                                  const NeverScrollableScrollPhysics(),
                              onPageChanged: handleOnPageChanged),
                          items: model!.listOfFields
                              .map((field) {
                                switch(field.type) {
                                  case 'Input':
                                    return FormTextField(fieldModel: field);
                                  case 'Date':
                                    return FormDateField(fieldModel: field);
                                  case 'Number':
                                    return FormNumberField(fieldModel: field);
                                  case 'Select':
                                    return FormSelectField(fieldModel: field);
                                  default:
                                    return FormTextField(fieldModel: field);
                                }
                              })
                              .toList(),
                        ),
                        ...currentIndex < model!.listOfFields.length - 1
                            ? [
                                Positioned(
                                    bottom: 10,
                                    right: 0,
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
                                      onPressed: goNextSlide,
                                    ))
                              ]
                            : [],
                        ...currentIndex > 0
                            ? [
                                Positioned(
                                    bottom: 10,
                                    left: 0,
                                    child: FloatingActionButton.extended(
                                      label: const Text('prev'),
                                      icon: const Icon(Icons.arrow_back),
                                      onPressed: goPrevSlide,
                                    ))
                              ]
                            : [],
                        ...currentIndex == model!.listOfFields.length - 1
                            ? [
                                Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: FloatingActionButton.extended(
                                      label: Row(
                                        children: const [
                                          Text('Save'),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Icon(Icons.check)
                                        ],
                                      ),
                                      onPressed: () {},
                                    ))
                              ]
                            : []
                      ],
                    )
                  : Stack(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: model!.listOfFields.length,
                            itemBuilder: (_, index) {
                              Widget? field;
                              switch (model!.listOfFields[index].type) {
                                case 'Input':
                                  field = FormTextField(
                                      fieldModel: model!.listOfFields[index]);
                                  break;
                                case 'Date':
                                  field = FormDateField(
                                      fieldModel: model!.listOfFields[index]);
                                  break;
                                case 'Number':
                                  field = FormNumberField(
                                      fieldModel: model!.listOfFields[index]);
                                  break;
                                case 'Select':
                                  field = FormSelectField(
                                      fieldModel: model!.listOfFields[index]);
                              }
                              return Column(
                                children: [
                                  field ?? Container(),
                                  ...index == model!.listOfFields.length - 1
                                      ? [
                                          const SizedBox(
                                            height: 80,
                                          )
                                        ]
                                      : []
                                ],
                              );
                            }),
                        Positioned(
                            bottom: 10,
                            right: 0,
                            child: FloatingActionButton.extended(
                              label: Row(
                                children: const [
                                  Text('Save'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(Icons.check)
                                ],
                              ),
                              onPressed: () {},
                            ))
                      ],
                    )
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
