import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangeInput extends StatefulWidget {
  const DateRangeInput({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onChange,
  });

  final DateTime startDate;
  final DateTime endDate;
  final void Function(DateTime startDate, DateTime endDate) onChange;

  @override
  State<DateRangeInput> createState() => _DateRangeInputState();
}

class _DateRangeInputState extends State<DateRangeInput> {
  final DateFormat _formatter = DateFormat('yyyy/MM/dd');

  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();

    startDate = widget.startDate;
    endDate = widget.endDate;
  }

  void _cancelHandler(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _okHandler(BuildContext buildContext) {
    widget.onChange(startDate, endDate);
    Navigator.of(context).pop();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      final value = args.value as PickerDateRange;
      startDate = value.startDate!;
      if (value.endDate != null) {
        endDate = value.endDate!;
      }
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
                    selectionMode: DateRangePickerSelectionMode.range,
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Date Range',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: _openDateDialog,
              child: Text(
                '${_formatter.format(widget.startDate)} - '
                '${_formatter.format(widget.endDate)}',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
