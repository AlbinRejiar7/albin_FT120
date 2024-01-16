import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_project_1/model/user_model.dart';
import 'package:test_project_1/screens/login/login.dart';
import 'package:test_project_1/screens/user_details/user_details.dart';

class NetworkServices extends GetxController {
  UserModel? userModel;
  String? accessToken;
  static Future<void> registerUser({
    required String userName,
    required String gender,
    required String number,
    required String email,
    required String password,
    required String location,
    required String dob,
    required Rx<File?> rximageFile,
  }) async {
    try {
      File? imageFile = rximageFile.value;
      if (imageFile == null) {
        Get.snackbar("Image", "Select Image");
        return;
      }
      var url = Uri.parse('http://trial.weberfox.in/test/api/register');
      var request = http.MultipartRequest('POST', url);
      request.fields['name'] = userName;
      request.fields['gender'] = gender;
      request.fields['phone'] = number;
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['location'] = location;
      request.fields['dob'] = dob;
      var multipartFile = http.MultipartFile.fromBytes(
          'avatar', await imageFile.readAsBytes(),
          filename: 'avatar.jpg');
      request.files.add(multipartFile);
      request.headers['Content-Type'] = 'application/form-data';
      try {
        var response = await request.send();

        if (response.statusCode == 201) {
          Get.snackbar("Success", "registered successfull");
          Get.to(() => Login());
        } else {
          Get.snackbar("message", "${response.reasonPhrase}");
        }
      } catch (e) {
        Get.snackbar("message", e.toString());
      }
    } on FileSystemException catch (e) {
      Get.snackbar("message", e.toString());
    } catch (e) {
      Get.snackbar("message", e.toString());
    }
  }

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse("http://trial.weberfox.in/test/api/login");

    try {
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email;
      request.fields['password'] = password;
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var jsonData = json.decode(responseBody);
      accessToken = jsonData['refresh_token'];
      if (response.statusCode == 200) {
        Get.snackbar("message", "${jsonData['message']}");
        Get.to(() => UserDetail(
              token: accessToken!,
            ));
      } else {
        Get.snackbar("message", "${jsonData['message']}");
      }
    } catch (e) {
      Get.snackbar("message", e.toString());
    }
  }

  Future<void> fetchUserData({required String token}) async {
    var url = Uri.parse("http://trial.weberfox.in/test/api/user-details");
    var headers = {'Authorization': 'Bearer $token'};

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body);
        userModel = UserModel.fromJson(decodedData);
      } else {
        Get.snackbar("ERROR", "Something went wrong");
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }
}
