import 'package:flutter/material.dart';

EdgeInsetsGeometry e1 = const EdgeInsets.symmetric(horizontal: 20, vertical: 5);
EdgeInsetsGeometry e2 =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10);
    
  double height(BuildContext context, double i) {
  double height = MediaQuery.of(context).size.height * i;
  return height;
}