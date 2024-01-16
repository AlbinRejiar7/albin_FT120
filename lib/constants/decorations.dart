import 'package:flutter/material.dart';
import 'package:test_project_1/constants/colors.dart';

RoundedRectangleBorder r1 = RoundedRectangleBorder(borderRadius: br1);
BorderRadius br1 = BorderRadius.circular(10);
BorderRadius br2 = const BorderRadius.only(
    bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30));
BoxDecoration d1 = BoxDecoration(color: green, borderRadius: br2);