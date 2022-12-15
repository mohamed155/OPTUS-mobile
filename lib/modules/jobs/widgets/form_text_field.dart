import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/forms.dart';

class FormTextField extends FormField<IDynamicFieldConfigModel> {
  final IDynamicFieldConfigModel fieldModel;

  FormTextField({Key? key, required this.fieldModel})
      : super(
            key: key,
            initialValue: fieldModel,
            validator: (model) {
              if ((model!.value == null || model.value.isEmpty) &&
                  model.mandatory) {
                return 'This field is required';
              }
              if (fieldModel.validations != null) {
                var validations = fieldModel.validations!;
                if (validations.isNotEmpty) {
                  for (IDynamicFieldValidatorModel validation in validations) {
                    if (validation.name == 'required' &&
                        (model.value == null || model.value.isEmpty)) {
                      return validation.message;
                    }
                    if (model.value != null &&
                        validation.name == 'pattern' &&
                        !RegExp(validation.pattern!).hasMatch(model.value)) {
                      return validation.message;
                    }
                  }
                }
              }
              return null;
            },
            builder: (field) {
              TextEditingController controller = TextEditingController();

              OutlineInputBorder inputBorder = OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              );

              InputDecoration inputDecoration({required String label}) =>
                  InputDecoration(
                      label: Text(
                        label,
                        style: const TextStyle(color: Colors.white),
                      ),
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder);

              if (fieldModel.value != null) {
                controller.text = fieldModel.value;
              }
              return Column(
                children: [
                  const SizedBox(height: 20,),
                  TextField(
                    cursorColor: Colors.white,
                    decoration: inputDecoration(label: field.value!.label!),
                    style: const TextStyle(color: Colors.white),
                    minLines: 3,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: controller,
                    onChanged: (String text) {
                      field.didChange(field.value!..value = text);
                    },
                  ),
                  Builder(builder: (_) {
                    if (field.value!.additionalComments != null) {
                      TextEditingController commentController =
                          TextEditingController();
                      commentController.text =
                          field.value!.additionalComments!.value;
                      return Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          TextField(
                            cursorColor: Colors.white,
                            decoration: inputDecoration(
                                label:
                                    field.value!.additionalComments!.placeholder ??
                                        ''),
                            style: const TextStyle(color: Colors.white),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            controller: commentController,
                            onChanged: (String text) {
                              field.didChange(
                                  field.value!..additionalComments!.value = text);
                            },
                          ),
                        ],
                      );
                    }
                    return Container();
                  })
                ],
              );
            });

  @override
  createState() => _FormTextFieldState();
}

class _FormTextFieldState extends FormFieldState<IDynamicFieldConfigModel> {
  @override
  FormTextField get widget => super.widget as FormTextField;

  @override
  void didChange(IDynamicFieldConfigModel? value) {
    super.didChange(value);
  }
}
