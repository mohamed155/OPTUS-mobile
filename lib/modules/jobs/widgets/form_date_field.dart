import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/widgets/date_picker.dart';

class FormDateField extends FormField<IDynamicFieldConfigModel> {
  FormDateField({super.key, required this.fieldModel})
      : super(
          initialValue: fieldModel,
          validator: (model) {
            if ((model!.value == null || (model.value as String).isEmpty) &&
                model.mandatory) {
              return 'Please answer this question';
            }
            if (fieldModel.validations != null) {
              final validations = fieldModel.validations!;
              if (validations.isNotEmpty) {
                for (final validation in validations) {
                  if (validation.name == 'required' &&
                      (model.value == null ||
                          (model.value as String).isEmpty)) {
                    return validation.message;
                  }
                  if (model.value != null &&
                      validation.name == 'pattern' &&
                      !RegExp(validation.pattern!)
                          .hasMatch(model.value as String)) {
                    return validation.message;
                  }
                }
              }
            }
            return null;
          },
          builder: (field) {
            final state = field as _FormTextFieldState;

            final showErrors = !field.isValid && state.isTouched;

            final inputBorder = OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            );

            final inputDecoration = InputDecoration(
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder,
            );

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
                            Text(
                              '(Mandatory)',
                              style: TextStyle(
                                color: Theme.of(state.context).primaryColor,
                              ),
                            ),
                          ]
                        : [],
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                DatePicker(
                  value: fieldModel.value as DateTime,
                  onChanged: (DateTime text) {
                    field.didChange(field.value!..value = text);
                  },
                  hasErrors: showErrors,
                ),
                ...showErrors
                    ? [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.errorMessage!,
                          style: TextStyle(
                            color: Theme.of(state.context).primaryColor,
                          ),
                        ),
                      ]
                    : [],
                Builder(
                  builder: (_) {
                    if (field.value!.additionalComments != null) {
                      final commentController = TextEditingController()
                        ..text =
                            field.value!.additionalComments!.value as String? ??
                                '';
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
                              field.didChange(
                                field.value!..additionalComments!.value = text,
                              );
                            },
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            );
          },
        );

  final IDynamicFieldConfigModel fieldModel;

  @override
  FormFieldState<IDynamicFieldConfigModel> createState() =>
      _FormTextFieldState();
}

class _FormTextFieldState extends FormFieldState<IDynamicFieldConfigModel> {
  bool isTouched = false;
  String? errorMessage;

  @override
  FormDateField get widget => super.widget as FormDateField;

  @override
  bool validate() {
    setState(() {
      isTouched = true;
      errorMessage = widget.validator!(widget.fieldModel);
    });
    return super.validate();
  }
}
