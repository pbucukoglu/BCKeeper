import 'package:bc_keeper/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:bc_keeper/presentation/widgets/AppButton.dart';
import 'package:get/get.dart';
import '../../widgets/CustomDrawer.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 50,
        title: Row(
          children: [
            SizedBox(width: 55),
            Text(
              'MyAccount'.tr,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          SizedBox(height: 20),
          AppButton(
            onPressed: () {
              // Handle button 1 press
              Get.toNamed(Routes.USERINFO);
            },
            buttonText: "UserInformation".tr,
            fillColor: Colors.blue[200],
            icon: Icons.person, // Add the icon for button 1
          ),
          SizedBox(height: 10),
          AppButton(
            onPressed: () {
              // Handle button 2 press
              Get.toNamed(Routes.CHANGEPASSWORD);
            },
            buttonText: "ChangePassword".tr,
            fillColor: Colors.blue[200],
            icon: Icons.lock, // Add the icon for button 2x
          ),
          SizedBox(height: 10),
          AppButton(
            onPressed: () {
              // Handle button 3 press
            },
            buttonText: "BecomePremiumUser".tr,
            fillColor: Colors.blue[200],
            icon: Icons.star, // Add the icon for button 3
          ),
          Expanded(
            child: Container(
              color: Colors.white, // Set background color to white
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
