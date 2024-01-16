import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_1/constants/dimensions.dart';
import 'package:test_project_1/constants/images.dart';
import 'package:test_project_1/constants/styles.dart';
import 'package:test_project_1/network_service/services.dart';
import 'package:test_project_1/screens/user_details/user_head.dart';
import 'package:test_project_1/widgets/name.dart';

class UserDetail extends StatelessWidget {
  final String token;
  UserDetail({
    super.key,
    required this.token,
  });

  var api = Get.put(NetworkServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: api.fetchUserData(token: token),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserHead(image: user),
                      Padding(
                        padding: e2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Personal Information', style: s15),
                              ],
                            ),
                            name(api.userModel!.data!.name ?? "NULL", 'Name'),
                            const SizedBox(height: 5),
                            name(api.userModel!.data!.email ?? "NULL", 'Email'),
                            const SizedBox(height: 5),
                            name(api.userModel!.data!.gender ?? "NULL",
                                'Gender'),
                            name(
                                "${api.userModel!.data!.dob?.year.toString()}-${api.userModel!.data!.dob?.month.toString()}-${api.userModel!.data!.dob?.day.toString()}",
                                'Date of Birth'),
                            const SizedBox(height: 5),
                            name(api.userModel!.data!.phone ?? "NULL",
                                'Contact Number'),
                            const SizedBox(height: 5),
                            name(api.userModel!.data!.location ?? "NULL",
                                'Location'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text("something wrong"));
            }
          }),
    );
  }
}
