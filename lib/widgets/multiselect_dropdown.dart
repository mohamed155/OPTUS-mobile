import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:tech2/interfaces/has_map.dart';

class MultiselectDropdown<V> extends StatelessWidget {
  List<Mappable> items;
  List<V> value;
  String valueProp;
  String labelProp;
  String label;
  bool? isLoading;
  void Function(List<V>) onChanged;

  MultiselectDropdown(
      {Key? key,
      required this.items,
      required this.value,
      required this.valueProp,
      required this.labelProp,
      required this.label,
      required this.onChanged,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  MultiSelectDialogField<V>(
                      buttonIcon: const Icon(Icons.arrow_drop_down),
                      initialValue: value,
                      items: items
                          .map((item) => MultiSelectItem<V>(
                              item.toMap()[valueProp], item.toMap()[labelProp]))
                          .toList(),
                      onConfirm: onChanged),
                  ...isLoading != null && isLoading!
                      ? [
                          Positioned(
                              top: 12,
                              right: 10,
                              child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 3,
                                    ),
                                  )))
                        ]
                      : []
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
