import 'package:bc_keeper/presentation/global_controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/routes/app_pages.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final Rxn<String> _currentPass = Rxn();
  final Rxn<String> _newPass = Rxn();

  //_ private yapar
  final Rxn<String> _confirmPass = Rxn();

  String get currentPass => _currentPass.value ?? "";
  set currentPass(String currentPass) => _currentPass.value = currentPass;

  String get newPass => _newPass.value ?? "";
  set newPass(String newPass) => _newPass.value = newPass;

  String get confirmPass => _confirmPass.value ?? "";
  set confirmPass(String confirmPass) => _confirmPass.value = confirmPass;

  Future<void> handleChangePassword() async {
    // Get the values entered in the text fields
    String currentPassword = currentPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Check if the current password matches the new password
    if (currentPassword == newPassword) {
      Get.snackbar(
          'Error', 'Current password and new password cannot be the same.');
      return;
    }

    // Check if the new password and confirm password match
    if (newPassword != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match!');
      return;
    }

    try {
      // Make the API call to reset the password

      AuthController controller = Get.find<AuthController>();
      await controller.resetPassword(currentPassword, newPassword);

      // Password change successful, show success message or navigate to a different screen
      Get.dialog(AlertDialog(
        title: Text('Success'),
        content: Text('Password has been changed successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          ),
        ],
      ));

      // Clear the text fields
      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
    } catch (e) {
      // Password change failed, show error message
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    currentPasswordController.addListener(() {
      currentPass = currentPasswordController.text;
    });

    newPasswordController.addListener(() {
      newPass = newPasswordController.text;
    });

    confirmPasswordController.addListener(() {
      confirmPass = confirmPasswordController.text;
    });

    super.onInit();
  }
}
