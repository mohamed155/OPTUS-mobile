import 'package:flutter/material.dart';
import 'package:tech2/interfaces/has_map.dart';

class Dropdown<T> extends StatelessWidget {
  final List<Mappable> items;
  final T? value;
  final String valueProp;
  final String labelProp;
  final String? label;
  final bool? isLoading;
  final void Function(T?)? onChanged;
  final bool? hasErrors;

  const Dropdown(
      {Key? key,
      required this.items,
      required this.valueProp,
      required this.labelProp,
      this.value,
      this.label,
      this.onChanged,
      this.isLoading,
      this.hasErrors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ]
              : [],
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    width: 2,
                    color: (hasErrors != null && hasErrors!)
                        ? Colors.red
                        : Colors.transparent)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                      icon: isLoading != null && isLoading!
                          ? Container(
                              width: 28,
                              height: 28,
                              margin: const EdgeInsets.all(10),
                              child: const CircularProgressIndicator())
                          : const Icon(Icons.arrow_drop_down),
                      value: value,
                      items: items
                          .map((Mappable item) => DropdownMenuItem<T>(
                                value: item.toMap()[valueProp],
                                child: Text(item.toMap()[labelProp]),
                              ))
                          .toList(),
                      isExpanded: true,
                      underline: null,
                      onChanged: onChanged),
                ),
              ),
            ),
          ),
        ]));
  }
}
