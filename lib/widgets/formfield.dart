import 'package:flutter/material.dart';
import 'package:test_project_1/constants/dimensions.dart';
import 'package:test_project_1/constants/styles.dart';

Widget formfield({required String label, required TextEditingController ctr}) {
  return Padding(
    padding: e1,
    child: SizedBox(
      height: 45,
      child: TextField(
        style: s22,
        autocorrect: true,
        controller: ctr,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
            labelStyle: s19),
      ),
    ),
  );
}

Widget passwordfield(
    {required bool obscure,
    required Function ontap,
    required String label,
    required bool showpassword,
    required TextEditingController ctr}) {
  return Padding(
      padding: e1,
      child: SizedBox(
          height: 45,
          child: TextField(
             controller: ctr,
              style: s22,
              autocorrect: true,
              obscureText: obscure,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: label,
                labelStyle: s19,
                suffixIcon: IconButton(
                    onPressed: () => ontap(),
                    icon: Icon(showpassword
                            ? Icons.visibility_off
                            : Icons.visibility)
              ),
             ))));
}

Widget formfields(
    {TextInputType? keyboardtype,
    int? maxLines,
    int? maxLength,
    required bool showIcon,
    required String label,
    required TextEditingController controller,
    required Function ontap}) {
  return Padding(
    padding: e1,
    child: SizedBox(
      height: 45,
      child: TextFormField(
        autocorrect: true,
        maxLength: maxLength,
        maxLines: maxLines,
        style: s22,
        keyboardType: keyboardtype,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
            hintStyle: s19,
            border: const OutlineInputBorder(),
            labelText: label,
            labelStyle: s19,
            suffixIcon: GestureDetector(
                onTap: () => ontap(),
                child: showIcon
                    ? const Icon(Icons.calendar_month, size: 20)
                    : const SizedBox())),
      ),
    ),
  );
}