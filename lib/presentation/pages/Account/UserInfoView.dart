import 'dart:io';
import 'package:bc_keeper/data/providers/network/apis/user_services.dart';
import 'package:bc_keeper/data/providers/network/dio_interceptor.dart';
import 'package:bc_keeper/presentation/pages/Account/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../global_controllers/auth/auth_controller.dart';

class UserInfoView extends StatelessWidget {
  UserInfoView({
    Key? key,
  }) : super(key: key);

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final user = authController.user.value;

    final UserInfoController userInfoController = Get.put(UserInfoController(
        userService:
            UserService(httpClient: getInstance(user?.token), user: user)));

    return Scaffold(
      appBar: AppBar(
        title: Text('UserInfo'.tr),
        actions: [
          GestureDetector(
            onTap: () => userInfoController.saveUserInfo(),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                child: Icon(Icons.save)),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: Colors.blue,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Obx(() => GestureDetector(
                        onTap: userInfoController.openCamera,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: userInfoController
                                      .selectedImagePath.value !=
                                  null
                              ? FileImage(File(
                                  userInfoController.selectedImagePath.value!))
                              : NetworkImage(
                                  'https://api.bckeeper.com/${user?.picturepath}${user?.pictureurl ?? "empty.jpg"}',
                                ) as ImageProvider<Object>?,
                        ),
                      )),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: userInfoController.openCamera,
                        child: Text(
                          'Camera'.tr,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      InkWell(
                        onTap: userInfoController.selectImageFromGallery,
                        child: Text(
                          'Gallery'.tr,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  UserInfoItem(
                    label: 'Title:'.tr,
                    controller: userInfoController.titleController,
                    labelColor: Colors.white,
                    valueColor: Colors.white,
                  ),
                  SizedBox(height: 8),
                  UserInfoItem(
                    label: 'FirstName:'.tr,
                    controller: userInfoController.nameController,
                    labelColor: Colors.white,
                    valueColor: Colors.white,
                  ),
                  SizedBox(height: 8),
                  UserInfoItem(
                    label: 'LastName:'.tr,
                    controller: userInfoController.surnameController,
                    labelColor: Colors.white,
                    valueColor: Colors.white,
                  ),
                  SizedBox(height: 8),
                  UserInfoItem(
                    label: 'Email:'.tr,
                    controller: userInfoController.mailController,
                    labelColor: Colors.white,
                    valueColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoItem extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color valueColor;
  final TextEditingController controller;

  const UserInfoItem({
    Key? key,
    required this.label,
    required this.controller,
    this.labelColor = Colors.grey,
    this.valueColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 120, // Sabit bir genişlik atayarak sol kenarı hizalarız
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(1),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: valueColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                border: Border.all(
                  color: Colors.grey[700]!,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: controller,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onFieldSubmitted: (newValue) {
                  // Perform any desired action when the text is submitted
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
