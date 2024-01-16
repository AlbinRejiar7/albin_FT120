import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_1/constants/dimensions.dart';
import 'package:test_project_1/constants/styles.dart';
import 'package:test_project_1/controller/register.dart';
import 'package:test_project_1/network_service/services.dart';
import 'package:test_project_1/screens/register/register_image.dart';
import 'package:test_project_1/widgets/custombutton.dart';
import 'package:test_project_1/widgets/dropdown.dart';
import 'package:test_project_1/widgets/formfield.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    var ctr = Get.put(RegisterController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => RegisterImage(
                  image: ctr.selectedImage.value != null
                      ? FileImage(ctr.selectedImage.value!)
                      : null,
                  ontap: () => ctr.openImagePicker(),
                  selectimage: ctr.selectedImage.value == null
                      ? const Icon(Icons.person, size: 80)
                      : null,
                  onpressed: () => ctr.openImagePicker())),
              formfield(label: 'Full Name', ctr: ctr.name),
              const SizedBox(height: 10),
              DropDownField(
                  value: ctr.selectGender,
                  items: ctr.gender
                      .map((e) => DropdownMenuItem<String>(
                          value: e, child: Text(e, style: s19)))
                      .toList(),
                  onchanged: (gender) => ctr.selectedGender(gender)),
              Obx(() => formfields(
                  showIcon: true,
                  label: 'Date of Birth',
                  controller: TextEditingController(
                      text: ctr.selectDate.value != null
                          ? '${ctr.selectDate.value!.year}-${ctr.selectDate.value!.month}-${ctr.selectDate.value!.day}'
                          : ''),
                  ontap: () => ctr.selectedDate(context))),
              formfield(ctr: ctr.location, label: 'Location'),
              formfields(
                  keyboardtype: TextInputType.phone,
                  showIcon: false,
                  controller: ctr.phone,
                  label: 'Contact',
                  ontap: () {}),
              formfield(label: 'Email', ctr: ctr.email),
              const SizedBox(height: 10),
              Obx(() => passwordfield(
                  obscure: ctr.obscure.value,
                  ontap: () => ctr.toggleObscure(),
                  label: 'New Password',
                  showpassword: ctr.obscure.value,
                  ctr: ctr.password)),
              const SizedBox(height: 10),
              Obx(() => passwordfield(
                  obscure: ctr.obscure1.value,
                  ontap: () => ctr.toggleObscure1(),
                  label: 'Confirm Password',
                  showpassword: ctr.obscure1.value,
                  ctr: ctr.cpassword)),
              const SizedBox(height: 10),
              Padding(
                  padding: e1,
                  child: customButton(
                      ontap: () async {
                        if (ctr.selectedImage.value != null) {
                          await NetworkServices.registerUser(
                              userName: ctr.name.text,
                              gender: ctr.selectGender.toString(),
                              number: ctr.phone.text,
                              email: ctr.email.text,
                              password: ctr.cpassword.text,
                              location: ctr.location.text,
                              dob: ctr.selectDate.toString(),
                              rximageFile: ctr.selectedImage);
                        } else {
                          Get.snackbar(
                              "IMAGE ERROR", "You Need to pick an Image");
                        }
                      },
                      label: 'Register')),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
