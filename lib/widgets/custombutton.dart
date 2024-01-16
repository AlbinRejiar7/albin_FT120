import 'package:flutter/material.dart';
import 'package:test_project_1/constants/colors.dart';
import 'package:test_project_1/constants/decorations.dart';

Widget customButton({required Function ontap, required String label}) {
  return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: r1, backgroundColor: green),
          onPressed: () => ontap(),
          child: Text(label,style: const TextStyle(color: white))));
}

Widget button(
    {required String label, required Function ontap, required TextStyle t1}) {
  return TextButton(onPressed: () => ontap(), child: Text(label, style: t1));
}