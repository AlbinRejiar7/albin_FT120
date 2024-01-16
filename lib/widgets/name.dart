import 'package:flutter/material.dart';
import 'package:test_project_1/constants/decorations.dart';
import 'package:test_project_1/constants/dimensions.dart';
import 'package:test_project_1/constants/styles.dart';

Widget name(String name, String label) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        child: Card(
          shape: r1,
          elevation: 2,
          child: Padding(
            padding: e2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: s14),
                const SizedBox(height: 5),
                Text(name, style: s17),
              ],
            ),
          ),
        ),
      )
    ],
  );
}