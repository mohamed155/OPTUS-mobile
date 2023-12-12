import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tech2/utilities/date_formatter.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.hasErrors,
  });

  final DateTime? value;
  final void Function(DateTime value) onChanged;
  final bool? hasErrors;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime? value;
  bool valid = true;

  TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextDateFormatter dateFormatter = TextDateFormatter();

  OutlineInputBorder inputBorder({required bool hasError}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: hasError ? Theme.of(context).primaryColor : Colors.white,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  @override
  void initState() {
    super.initState();

    value = widget.value;
    if (value != null) {
      textController.text = DateFormatter().formatDate(value!);
    }
  }

  bool _validateDateString(String text) =>
      RegExp(r'^([0-2]\d|(3)[0-1])(/)(((0)\d)|((1)[0-2]))(/)\d{4}$')
          .hasMatch(text);

  void _cancelHandler(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _okHandler(BuildContext buildContext) {
    widget.onChanged(value!);
    Navigator.of(context).pop();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      value = args.value as DateTime?;
      textController.text = DateFormatter().formatDate(value!);
    });
  }

  void _openDateDialog() {
    Navigator.of(context).push(
      DialogRoute<Widget>(
        context: context,
        builder: (_) {
          return Center(
            child: Container(
              width: 300,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SfDateRangePicker(
                    onSelectionChanged: _onSelectionChanged,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => _cancelHandler(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => _okHandler(context),
                          child: const Text('OK'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onChangeText(String text) {
    if (_validateDateString(text)) {
      final dateArr = text.split('/').map(int.parse).toList();
      setState(() {
        value = DateTime(dateArr[2], dateArr[1], dateArr[0]);
        widget.onChanged(value!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Focus(
        onFocusChange: (_) => _formKey.currentState!.validate(),
        child: TextFormField(
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          inputFormatters: [dateFormatter],
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              onPressed: _openDateDialog,
            ),
            border: inputBorder(
              hasError: widget.hasErrors != null && widget.hasErrors!,
            ),
            enabledBorder: inputBorder(
              hasError: widget.hasErrors != null && widget.hasErrors!,
            ),
            focusedBorder: inputBorder(
              hasError: widget.hasErrors != null && widget.hasErrors!,
            ),
          ),
          validator: (String? value) {
            if (value != null &&
                value.isNotEmpty &&
                !_validateDateString(value)) {
              return 'Invalid date value';
            }
            return null;
          },
          controller: textController,
          onChanged: _onChangeText,
        ),
      ),
    );
  }
}

class TextDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    final oldText = oldValue.text;
    var cursorIndex = newValue.selection.end;
    if ((!RegExp(r'^\d*(?:[/\d]*)?$').hasMatch(text)) || text.length > 10) {
      cursorIndex--;
      return TextEditingValue(
        text: oldText,
        selection: TextSelection.collapsed(offset: cursorIndex),
      );
    }
    if (text.isNotEmpty && text.length < 10 && text.length >= oldText.length) {
      final dateParts = text.split('/');
      switch (dateParts.length) {
        case 1:
          if (dateParts[0].length == 1 && int.parse(dateParts[0]) > 3) {
            text = '0${dateParts[0]}/';
            cursorIndex += 2;
          } else if (dateParts[0].length == 2) {
            if (int.parse(dateParts[0]) > 31) {
              text = '31/';
              cursorIndex++;
            } else if (int.parse(dateParts[0]) < 1) {
              text = '01/';
              cursorIndex++;
            }
          }
          break;
        case 2:
          if (dateParts[1].length == 1 && int.parse(dateParts[1]) > 1) {
            text = '${dateParts[0]}/0${dateParts[1]}/';
            cursorIndex += 2;
          } else if (dateParts[1].length == 2) {
            if (int.parse(dateParts[1]) > 12) {
              text = '${dateParts[0]}/12/';
              cursorIndex++;
            } else if (int.parse(dateParts[1]) < 1) {
              text = '${dateParts[0]}/01/';
              cursorIndex++;
            }
          }
          break;
        case 3:
          if (dateParts[2].length == 1) {
            if (int.parse(dateParts[2]) > 2) {
              text = '${dateParts[0]}/${dateParts[1]}/2100';
              cursorIndex += 3;
            } else if (int.parse(dateParts[2]) < 1) {
              text = '${dateParts[0]}/${dateParts[1]}/1900';
              cursorIndex += 3;
            }
          } else if (dateParts[2].length == 2) {
            if (int.parse(dateParts[2]) > 21) {
              text = '${dateParts[0]}/${dateParts[1]}/2100';
              cursorIndex += 2;
            } else if (int.parse(dateParts[2]) < 19) {
              text = '${dateParts[0]}/${dateParts[1]}/1900';
              cursorIndex += 2;
            }
          } else if (dateParts[2].length == 3) {
            if (int.parse(dateParts[2]) > 210) {
              text = '${dateParts[0]}/${dateParts[1]}/2100';
              cursorIndex++;
            } else if (int.parse(dateParts[2]) < 190) {
              text = '${dateParts[0]}/${dateParts[1]}/1900';
              cursorIndex++;
            }
          } else if (dateParts[2].length == 4) {
            if (int.parse(dateParts[2]) > 2100) {
              text = '${dateParts[0]}/${dateParts[1]}/2100';
            } else if (int.parse(dateParts[2]) < 1900) {
              text = '${dateParts[0]}/${dateParts[1]}/1900';
            }
          }
          break;
      }
      if (text.length == 2 || text.length == 5) {
        cursorIndex++;
        return TextEditingValue(
          text: '$text/',
          selection: TextSelection.collapsed(offset: cursorIndex),
        );
      }
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: cursorIndex),
    );
  }
}
