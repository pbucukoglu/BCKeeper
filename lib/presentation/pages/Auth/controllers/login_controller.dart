import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';
import '../../../global_controllers/auth/auth_controller.dart';

class LoginController extends GetxController {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

//  final Rxn<String> _email = Rxn("yavuzilik@gmail.com");
//  final Rxn<String> _password = Rxn("sifresifre123");

  final Rxn<String> _email = Rxn("");
  final Rxn<String> _password = Rxn("");

  String get email => _email.value ?? "";
  set email(String name) => _email.value = name;

  String get password => _password.value ?? "";
  set password(String pass) => _password.value = pass;

  Future<void> login() async {
    AuthController authController = Get.find<AuthController>();
    Get.offAndToNamed(Routes.INITIAL);

    if (email.isEmpty) {
      Get.snackbar(
          "Hatalı Kullanıcı Adı", "Lütfen geçerli bir kullanıcı adı giriniz.",
          backgroundColor: Colors.red);
      return;
    }

    if (password.isEmpty) {
      Get.snackbar("Hatalı Şifre", "Lütfen bir şifre giriniz.",
          backgroundColor: Colors.purple[200]?.withOpacity(0.5));
      return;
    }

    if (await authController.signIn(email, password) == false) {
      Get.snackbar(
        "Yanlış Bilgi",
        "Kullanıcı adı veya şifre hatalı.",
        backgroundColor: Colors.purple[200]?.withOpacity(0.5),
      );
      return;
    }
  }

  @override
  void onInit() {
    emailTextController.text = email;
    passwordTextController.text = password;
    emailTextController.addListener(() {
      email = emailTextController.text;
    });
    passwordTextController.addListener(() {
      password = passwordTextController.text;
    });

    super.onInit();
  }
}
