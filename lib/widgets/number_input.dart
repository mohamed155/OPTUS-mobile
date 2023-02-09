import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatelessWidget {
  final int value;
  final String? label;
  final Color? labelColor;
  final void Function(int) onChange;

  const NumberInput(
      {Key? key,
      required this.value,
      this.label,
      this.labelColor,
      required this.onChange})
      : super(key: key);

  decrement() {
    onChange(value - 1);
  }

  increment() {
    onChange(value + 1);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = '$value';

    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(children: [
          ...label != null
              ? [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(right: 10),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      label!,
                      style: TextStyle(
                          color: labelColor ?? Colors.white, fontSize: 16),
                    ),
                  )
                ]
              : [],
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextButton(
                        onPressed: decrement,
                        child: const Icon(Icons.horizontal_rule)),
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textAlign: TextAlign.center,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: TextButton(
                          onPressed: increment, child: const Icon(Icons.add))),
                ],
              ),
            ),
          )
        ]));
  }
}
