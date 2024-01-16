import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  //------------------------------------------------------------------Toggle Obscure
  final RxBool obscure = true.obs;
  final RxBool obscure1 = true.obs;

  void toggleObscure() {
    obscure(!obscure.value);
  }

  void toggleObscure1() {
    obscure1(!obscure1.value);
  }

  //------------------------------------------------------------------Select Gender
  String _selectGender = 'Select Gender';
  String get selectGender => _selectGender;
  List<String> gender = ['Select Gender', 'Male', 'Female', 'Other'];

  selectedGender(gender) {
    _selectGender = gender;
  }

  //------------------------------------------------------------------Select Date
  final Rx<DateTime?> selectDate = Rx<DateTime?>(null);

  Future<void> selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectDate.value = picked;
    } else {
      if (kDebugMode) {
        print('Date of Birth not Selected');
      }
    }
  }

  //------------------------------------------------------------------Select Image from Gallery
  final Rx<File?> selectedImage = Rx<File?>(null);
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage.value = File(pickedImage.path);
    } else {
      if (kDebugMode) {
        print('Image not Selected');
      }
    }
  }
}
