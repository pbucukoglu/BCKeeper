import 'package:bc_keeper/presentation/pages/Account/controllers/change_password_controller.dart';
import 'package:bc_keeper/presentation/pages/Account/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../data/providers/network/apis/auth_service.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
  ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

  ChangePasswordController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CurrentPassword:'.tr,
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: changePasswordController.currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Entercurrentpassword'.tr,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'NewPassword:'.tr,
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: changePasswordController.newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enternewpassword'.tr,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'EnterNewPasswordAgain'.tr,
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: changePasswordController.confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirmnewpassword'.tr,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: changePasswordController.handleChangePassword,
              child: Align(
                  alignment: Alignment.center,
                  child: Text('ChangePassword'.tr)),
            ),
          ],
        ),
      ),
    );
  }
}
