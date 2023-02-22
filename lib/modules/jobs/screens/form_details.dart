import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/modules/jobs/services/forms_service.dart';
import 'package:tech2/modules/jobs/widgets/form_checkbox_field.dart';
import 'package:tech2/modules/jobs/widgets/form_date_field.dart';
import 'package:tech2/modules/jobs/widgets/form_number_field.dart';
import 'package:tech2/modules/jobs/widgets/form_photo_field.dart';
import 'package:tech2/modules/jobs/widgets/form_select_field.dart';
import 'package:tech2/modules/jobs/widgets/form_text_field.dart';

class FormFieldMapper extends StatelessWidget {
  const FormFieldMapper({super.key, required this.model});

  final IDynamicFieldConfigModel model;

  static final Map<
      String,
      FormField<IDynamicFieldConfigModel> Function(
    IDynamicFieldConfigModel,
  )> _fields = {
    'Input': (IDynamicFieldConfigModel model) =>
        FormTextField(fieldModel: model),
    'Date': (IDynamicFieldConfigModel model) =>
        FormDateField(fieldModel: model),
    'Number': (IDynamicFieldConfigModel model) =>
        FormNumberField(fieldModel: model),
    'Select': (IDynamicFieldConfigModel model) =>
        FormSelectField(fieldModel: model),
    'Checkbox': (IDynamicFieldConfigModel model) =>
        FormCheckBoxField(fieldModel: model),
    'Photo': (IDynamicFieldConfigModel model) =>
        FormPhotoField(fieldModel: model),
  };

  @override
  Widget build(BuildContext context) {
    return _fields[model.type]!(model);
  }
}

class FormDetailsScreen extends StatefulWidget {
  const FormDetailsScreen({super.key, required this.formDetailsInput});

  final FormDetailInput formDetailsInput;

  @override
  State<FormDetailsScreen> createState() => _FormDetailsScreenState();
}

class _FormDetailsScreenState extends State<FormDetailsScreen> {
  FormResponseModelDto? model;
  int currentIndex = 0;
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  CarouselController sliderController = CarouselController();

  @override
  void initState() {
    super.initState();

    loadFormResponse();
  }

  void loadFormResponse() {
    FormsService()
        .getFormResponseModel(
          widget.formDetailsInput.formId,
          widget.formDetailsInput.formResponseId,
        )
        .then((data) => setState(() => model = data));
  }

  void goPrevSlide() {
    if (currentIndex > 0) {
      sliderController.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
      setState(() {
        currentIndex--;
      });
    }
  }

  void goNextSlide() {
    if (currentIndex < model!.listOfFields.length && validateForm()) {
      sliderController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
      setState(() {
        currentIndex++;
      });
    }
  }

  void saveForm() {
    if (validateForm()) {
      setState(() => loading = true);
      _formKey.currentState?.save();
      FormsService()
          .saveFormResponse(model!)
          .then((_) => Navigator.pop(context))
          .whenComplete(() => setState(() => loading = false));
    }
  }

  bool validateForm() {
    return _formKey.currentState!.validate();
  }

  void handleOnPageChanged(int index, _) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.formDetailsInput.formName),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [
              Colors.black87,
              Colors.black,
            ],
            stops: [0.1, 10],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: model != null
                ? model!.isWizard
                    ? Stack(
                        children: [
                          CarouselSlider(
                            carouselController: sliderController,
                            options: CarouselOptions(
                              height: screenHeight,
                              viewportFraction: 1,
                              enableInfiniteScroll: false,
                              scrollPhysics:
                                  const NeverScrollableScrollPhysics(),
                              onPageChanged: handleOnPageChanged,
                            ),
                            items: model!.listOfFields
                                .map((field) => FormFieldMapper(model: field))
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
                                    ),
                                  )
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
                                    ),
                                  )
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
                                      onPressed: saveForm,
                                    ),
                                  )
                                ]
                              : []
                        ],
                      )
                    : Stack(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: model!.listOfFields.length,
                            itemBuilder: (_, index) {
                              Widget? field;
                              field = FormFieldMapper(
                                model: model!.listOfFields[index],
                              );
                              return Column(
                                children: [
                                  field,
                                  ...index == model!.listOfFields.length - 1
                                      ? [
                                          const SizedBox(
                                            height: 80,
                                          )
                                        ]
                                      : []
                                ],
                              );
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            right: 0,
                            child: FloatingActionButton.extended(
                              label: Row(
                                children: [
                                  const Text('Save'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  if (loading)
                                    const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      ),
                                    )
                                  else
                                    const Icon(Icons.check)
                                ],
                              ),
                              onPressed: loading ? null : saveForm,
                            ),
                          )
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
      ),
    );
  }
}
