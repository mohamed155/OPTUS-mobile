import 'package:flutter/material.dart';

import 'package:tech2/interfaces/has_map.dart';

class Dropdown<V> extends StatelessWidget {
  List<Mappable> items;
  V value;
  String valueProp;
  String labelProp;
  String label;
  bool? isLoading;
  void Function(V?)? onChanged;

  Dropdown(
      {Key? key,
      required this.items,
      required this.value,
      required this.valueProp,
      required this.labelProp,
      required this.label,
      this.onChanged,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(children: [
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
              child: DropdownButton<V>(
                  icon: isLoading != null && isLoading!
                      ? Container(
                          width: 28,
                          height: 28,
                          margin: const EdgeInsets.all(10),
                          child: const CircularProgressIndicator())
                      : const Icon(Icons.arrow_drop_down),
                  value: value,
                  items: items
                      .map((Mappable item) => DropdownMenuItem<V>(
                            value: item.toMap()[valueProp],
                            child: Text(item.toMap()[labelProp]),
                          ))
                      .toList(),
                  isExpanded: true,
                  onChanged: onChanged),
            ),
          ),
        ]));
  }
}
