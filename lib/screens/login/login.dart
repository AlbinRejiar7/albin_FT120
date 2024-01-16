import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_1/constants/dimensions.dart';
import 'package:test_project_1/constants/images.dart';
import 'package:test_project_1/constants/styles.dart';
import 'package:test_project_1/controller/login.dart';
import 'package:test_project_1/network_service/services.dart';
import 'package:test_project_1/screens/register/register.dart';
import 'package:test_project_1/widgets/custombutton.dart';
import 'package:test_project_1/widgets/formfield.dart';
import 'package:test_project_1/widgets/logintext.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var ctr = Get.put(LoginController());
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      const SizedBox(height: 70),
      const Image(image: AssetImage(logo)),
      const SizedBox(height: 20),
      Text("Welcome to Doctor App", textAlign: TextAlign.center, style: s4),
      const SizedBox(height: 20),
      loginText(
          showtext: true, ontap: () {}, label: "Login as", label1: 'Patient'),
      const SizedBox(height: 40),
      formfield(ctr: ctr.email, label: 'Email'),
      const SizedBox(height: 10),
      Obx(() => passwordfield(
          obscure: ctr.obscure.value,
          ontap: () => ctr.toggleObscure(),
          label: 'Password',
          showpassword: ctr.obscure.value,
          ctr: ctr.password)),
      const SizedBox(height: 40),
      Padding(
          padding: e1,
          child: customButton(
              ontap: () async {
                try {
                  await NetworkServices().userLogin(
                    email: ctr.email.text,
                    password: ctr.password.text,
                  );
                  ctr.email.clear();
                  ctr.password.clear();
                } catch (e) {
                  Get.snackbar("Error", e.toString());
                }
              },
              label: 'L O G  I N')),
      const SizedBox(height: 70),
      loginText(
          label: "Don't have an Account?",
          label1: 'SIGN UP',
          ontap: () => Get.to(() => const Register()),
          showtext: true),
    ]))));
  }
}
