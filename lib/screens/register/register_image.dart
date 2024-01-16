import 'package:flutter/material.dart';
import 'package:test_project_1/constants/colors.dart';

class RegisterImage extends StatelessWidget {
  const RegisterImage(
      {super.key,
      required this.image,
      required this.ontap,
      required this.onpressed,
      required this.selectimage});

  final ImageProvider<Object>? image;
  final Function ontap;
  final Widget? selectimage;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
         Center(
            child:  GestureDetector(
                onTap: () => ontap(),
                child: CircleAvatar(backgroundColor: green,
                    radius: 80, backgroundImage: image, child: selectimage))),
        TextButton(
            onPressed: () => onpressed(), child: const Text("UPLOAD IMAGE",style: TextStyle(color: green),))
      ],
    );
  }
}