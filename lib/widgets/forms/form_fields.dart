import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownItemMap {
  final String value;
  final String label;

  DropdownItemMap({required this.value, required this.label});
}

class FormFields {
  static Widget textField({
    required Function(String) onChanged,
    required String label,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    value,
  }) {
    return TextFormField(
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(labelText: label),
      validator: validator,
      keyboardType: keyboardType,
      initialValue: value,
    );
  }

  static Widget numberField({
    required Function(String) onChanged,
    required String label,
    String? Function(String?)? validator,
    value,
  }) {
    return TextFormField(
      onChanged: (value) => onChanged(value.isEmpty ? '0' : value),
      inputFormatters: <TextInputFormatter>[
        // Numbers and dots only
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
      ],
      decoration: InputDecoration(labelText: label),
      validator: validator,
      keyboardType: TextInputType.number,
      initialValue: value,
    );
  }

  static Widget dropDown({
    required String value,
    required Function(String?) onChanged,
    List<String>? items,
    List<DropdownItemMap>? itemMap,
    required String label,
  }) {
    // Items can be a list of strings or a list of DropdownItemMap
    List<DropdownMenuItem<String>>? itemList = [];
    if (items != null) {
      itemList = items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList();
    } else if (itemMap != null) {
      itemList = itemMap.map<DropdownMenuItem<String>>((DropdownItemMap item) {
        return DropdownMenuItem(
          value: item.value,
          child: Text(item.label),
        );
      }).toList();
    }

    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      items: itemList,
      decoration: InputDecoration(labelText: label),
    );
  }

  static Widget checkBox({
    required bool value,
    required Function(bool?) onChanged,
    required String label,
  }) {
    return CheckboxListTile(
      title: Text(label),
      value: value,
      onChanged: onChanged,
    );
  }
}
