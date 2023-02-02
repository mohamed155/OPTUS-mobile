import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/widgets/image_picker.dart';

class FormPhotoField extends FormField<IDynamicFieldConfigModel> {
  final IDynamicFieldConfigModel fieldModel;

  FormPhotoField({Key? key, required this.fieldModel})
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
              final _FormTextFieldState state = field as _FormTextFieldState;

              final bool showErrors = !field.isValid && state.isTouched;

              OutlineInputBorder inputBorder = OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              );

              InputDecoration inputDecoration = InputDecoration(
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Q${field.value!.index} - ${field.value!.label!}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ...field.value!.mandatory
                          ? [
                              const Text(
                                '(Mandatory)',
                                style: TextStyle(color: Colors.red),
                              )
                            ]
                          : []
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ImagePicker(
                    image: fieldModel.value != null
                        ? Image.network(fieldModel.value)
                        : null,
                    onSelectImage: (Image? image) {},
                    hasErrors: showErrors,
                  ),
                  ...showErrors
                      ? [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(state.errorMessage!,
                              style: const TextStyle(color: Colors.red))
                        ]
                      : [],
                  Builder(builder: (_) {
                    if (field.value!.additionalComments != null) {
                      TextEditingController commentController =
                          TextEditingController();
                      commentController.text =
                          field.value!.additionalComments!.value ?? '';
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            field.value!.additionalComments!.placeholder ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            cursorColor: Colors.white,
                            decoration: inputDecoration,
                            style: const TextStyle(color: Colors.white),
                            minLines: 3,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            controller: commentController,
                            onChanged: (String text) {
                              field.didChange(field.value!
                                ..additionalComments!.value = text);
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
  bool isTouched = false;
  String? errorMessage;

  @override
  FormPhotoField get widget => super.widget as FormPhotoField;

  @override
  bool validate() {
    setState(() {
      isTouched = true;
      errorMessage = widget.validator!(widget.fieldModel);
    });
    return super.validate();
  }
}