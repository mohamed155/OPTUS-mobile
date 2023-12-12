import 'package:flutter/material.dart';
import 'package:tech2/interfaces/has_map.dart';

class Dropdown<T> extends StatelessWidget {
  const Dropdown({
    super.key,
    required this.items,
    required this.valueProp,
    required this.labelProp,
    this.value,
    this.label,
    this.labelColor,
    this.onChanged,
    this.isLoading,
    this.borderColor,
    this.hasErrors,
  });

  final List<Mappable> items;
  final T? value;
  final String valueProp;
  final String labelProp;
  final String? label;
  final Color? labelColor;
  final bool? isLoading;
  final Color? borderColor;
  final void Function(T?)? onChanged;
  final bool? hasErrors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ...label != null
              ? [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(right: 10),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      label!,
                      style: TextStyle(
                        color: labelColor ?? Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ]
              : [],
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 2,
                color: (hasErrors != null && hasErrors!)
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: borderColor != null
                      ? Border.all(color: borderColor!)
                      : null,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    style: const TextStyle(color: Colors.black),
                    icon: isLoading != null && isLoading!
                        ? Container(
                            width: 28,
                            height: 28,
                            margin: const EdgeInsets.all(10),
                            child: const CircularProgressIndicator(),
                          )
                        : const Icon(Icons.arrow_drop_down),
                    value: value,
                    items: items
                        .map(
                          (Mappable item) => DropdownMenuItem<T>(
                            value: item.toMap()[valueProp] as T?,
                            child: Text(item.toMap()[labelProp] as String),
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    onChanged: onChanged,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
