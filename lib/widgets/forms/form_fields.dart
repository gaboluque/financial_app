import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class DropdownItemMap {
  final String value;
  final dynamic label;

  DropdownItemMap({required this.value, required this.label});
}

class FormFields {
  static Widget textField(
      {required String label,
      required String name,
      String? Function(String?)? validator,
      TextInputType keyboardType = TextInputType.text,
      initialValue}) {
    return FormBuilderTextField(
      key: Key(name),
      name: name,
      decoration: InputDecoration(labelText: label),
      validator: validator,
      keyboardType: keyboardType,
      initialValue: initialValue,
    );
  }

  static Widget numberField({
    required String label,
    required String name,
    String? Function(String?)? validator,
    initialValue = '',
  }) {
    return FormBuilderTextField(
        key: Key(name),
        name: name,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
        ],
        decoration: InputDecoration(labelText: label),
        validator: validator,
        keyboardType: TextInputType.number,
        initialValue:
            initialValue == null || initialValue.isEmpty ? '' : initialValue);
  }

  static Widget dropDown({
    List<String>? items,
    List<DropdownItemMap>? itemMap,
    required String label,
    required String name,
    initialValue,
    String? Function(String?)? validator,
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
          child: item.label is String ? Text(item.label) : item.label as Widget,
        );
      }).toList();
    }

    return FormBuilderDropdown<String>(
      key: Key(name),
      name: name,
      items: itemList,
      decoration: InputDecoration(labelText: label),
      initialValue: initialValue,
      validator: validator,
    );
  }

  static Widget checkBox({
    required String label,
    required String name,
    initialValue = false,
  }) {
    return FormBuilderCheckbox(
      key: Key(name),
      name: name,
      title: Text(label),
      initialValue: initialValue,
    );
  }

  static Widget datePicker({
    required String name,
    required String label,
    String? Function(DateTime?)? validator,
    DateTime? initialValue,
  }) {
    return FormBuilderDateTimePicker(
      key: Key(name),
      name: name,
      inputType: InputType.date,
      format: DateFormat('yyyy-MM-dd'),
      decoration: InputDecoration(labelText: label),
      validator: validator,
      initialValue: initialValue,
    );
  }

  static Widget textArea({
    required String label,
    required String name,
    String? Function(String?)? validator,
    int? maxLines,
    initialValue,
  }) {
    return FormBuilderTextField(
      key: Key(name),
      name: name,
      decoration: InputDecoration(labelText: label),
      validator: validator,
      maxLines: maxLines,
      initialValue: initialValue,
    );
  }
}
