import 'package:flutter/material.dart';
import 'package:test_project_1/constants/dimensions.dart';

class DropDownField extends StatelessWidget {
  const DropDownField(
      {super.key,
      required this.value,
      required this.items,
      required this.onchanged});

  final String value;
  final List<DropdownMenuItem<String>> items;
  final Function onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: e1,
        child: SizedBox(
            height: 45,
            child: DropdownButtonFormField(
                isDense: true,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    border: OutlineInputBorder()),
                value: value,
                items: items,
                onChanged: (value) => onchanged(value))));
  }
}