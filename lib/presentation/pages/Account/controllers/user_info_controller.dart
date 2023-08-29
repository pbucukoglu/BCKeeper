import 'dart:convert';
import 'dart:io';

import 'package:bc_keeper/data/models/UserModel.dart';
import 'package:bc_keeper/data/providers/network/apis/user_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global_controllers/auth/auth_controller.dart';

class UserInfoController extends GetxController {
  final UserService userService;
  final AuthController authController = Get.find();
  final ImagePicker _imagePicker = ImagePicker();

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController idController = TextEditingController();

  Rxn<String> selectedImagePath = Rxn<String>(null);

  RxBool isProfilePictureUpdated = false.obs;
  UserInfoController({required this.userService});
  Future<void> openCamera() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      isProfilePictureUpdated.value = true;
    }
  }

  Future<void> selectImageFromGallery() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      isProfilePictureUpdated.value = true;
    }
  }

  File? get selectedImageFile {
    if (selectedImagePath.value != null) {
      return File(selectedImagePath.value!);
    }
    return null;
  }

  Future<void> saveUserInfo() async {
    final currentUser = authController.user.value;
    final updatedUser = UserModel(
        title: titleController.text,
        name: nameController.text,
        surname: surnameController.text,
        email: mailController.text,
        picturechanged: isProfilePictureUpdated.value,
        imgstr: '',
        pictureurl: currentUser?.pictureurl ??
            currentUser?.name ??
            "bc_keeper${currentUser?.id}");

    if (isProfilePictureUpdated.value) {
      // Profil resmi güncellendiği zaman
      final file = selectedImageFile;
      if (file != null) {
        final bytes = await file.readAsBytes();
        final imgstr = "data:image/png;base64,${base64Encode(bytes)}";
        updatedUser.imgstr = imgstr;
      }
    }
    await userService.updateUserProfile(updatedUser);
  }

  @override
  void onInit() {
    selectedImagePath.value = null;
    var user = authController.user.value;
    titleController.text = user?.title ?? "";
    nameController.text = user?.name ?? "";
    surnameController.text = user?.surname ?? "";
    mailController.text = user?.email ?? "";
    idController.text = user?.id ?? "";
    super.onInit();
  }
}
