import 'package:flutter/material.dart';
import 'package:test_project_1/constants/colors.dart';
import 'package:test_project_1/widgets/custombutton.dart';

Widget loginText(
    {required String label,
    required String label1,
    required Function ontap,
    required bool showtext}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(label,
          style: showtext
              ? const TextStyle(fontSize: 15)
              : const TextStyle(fontSize: 20)),
      button(
          t1: showtext
              ? const TextStyle(fontSize: 15,color: green)
              : const TextStyle(fontSize: 18),
          label: label1,
          ontap: () => ontap()),
    ],
  );
}