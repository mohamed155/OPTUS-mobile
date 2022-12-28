import 'package:flutter/material.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/widgets/dropdown.dart';

class FormCheckBoxField extends FormField<IDynamicFieldConfigModel> {
  final IDynamicFieldConfigModel fieldModel;

  FormCheckBoxField({Key? key, required this.fieldModel})
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

              InputDecoration inputDecoration = InputDecoration(
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder);

              if (fieldModel.value != null) {
                controller.text = fieldModel.value;
              }
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
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: field.value!.checkboxes!.length,
                      itemBuilder: (_, index) {
                        return CheckboxListTile(
                            title: Text(
                              field.value!.checkboxes![index].label,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: field.value!.checkboxes![index].value,
                            onChanged: (value) {
                              field.value!.checkboxes![index].value = value!;
                              field.didChange(field.value);
                            });
                      }),
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
  @override
  FormCheckBoxField get widget => super.widget as FormCheckBoxField;
}
