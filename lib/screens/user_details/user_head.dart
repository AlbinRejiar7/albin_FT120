import 'package:flutter/material.dart';
import 'package:test_project_1/constants/decorations.dart';
import 'package:test_project_1/constants/dimensions.dart';
import 'package:test_project_1/constants/styles.dart';

class UserHead extends StatelessWidget {
  const UserHead({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height(context, 0.36),
      decoration: d1,
      child: Padding(
        padding: e2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),
              ],
            ),
            Text("Profile", style: s6),
            SizedBox(height: height(context, 0.025)),
            Text("Set Up your profile", style: s6),
            const SizedBox(height: 5),
            Text("Update your profile", textAlign: TextAlign.start, style: s12),
            const SizedBox(height: 15),
            CircleAvatar(radius: 50, backgroundImage: AssetImage(image)),
          ],
        ),
      ),
    );
  }
}
