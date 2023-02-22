import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tech2/interfaces/has_map.dart';

class MultiselectDropdown<V> extends StatefulWidget {
  const MultiselectDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.valueProp,
    required this.labelProp,
    required this.label,
    required this.onChanged,
    this.isLoading,
  });

  final List<Mappable> items;
  final List<V> value;
  final String valueProp;
  final String labelProp;
  final String label;
  final bool? isLoading;
  final void Function(List<V>) onChanged;

  @override
  State<MultiselectDropdown<V>> createState() => _MultiselectDropdownState<V>();
}

class _MultiselectDropdownState<V> extends State<MultiselectDropdown<V>> {
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
              widget.label,
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
                    key: GlobalKey(),
                    buttonIcon: const Icon(Icons.arrow_drop_down),
                    initialValue: widget.value,
                    items: widget.items
                        .map(
                          (item) => MultiSelectItem<V>(
                            item.toMap()[widget.valueProp] as V,
                            item.toMap()[widget.labelProp] as String,
                          ),
                        )
                        .toList(),
                    onConfirm: widget.onChanged,
                  ),
                  ...widget.isLoading != null && widget.isLoading!
                      ? [
                          const Positioned(
                            top: 12,
                            right: 10,
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                ),
                              ),
                            ),
                          )
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
