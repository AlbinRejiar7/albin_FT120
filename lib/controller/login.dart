import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController with ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  //------------------------------------------------------------------Toggle Obscure
  
  final RxBool obscure = true.obs;

  void toggleObscure() {
    obscure(!obscure.value);
  }
 
}