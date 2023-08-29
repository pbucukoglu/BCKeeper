import 'dart:async';

import 'package:bc_keeper/data/providers/network/apis/user_services.dart';
import 'package:bc_keeper/presentation/pages/Home/controllers/qr_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../app/routes/app_pages.dart';
import '../../Account/controllers/user_info_controller.dart';

class QrView extends StatefulWidget {
  const QrView({Key? key}) : super(key: key);

  @override
  _QrViewState createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  final QrController qrController = Get.put(QrController(
    userService: UserService(httpClient: Dio()),
  ));

  late Timer timer;
  int remainingSeconds = 180;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    qrController.dispose();
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();

        // Navigate back to home page
        Get.toNamed(Routes.HOME);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserInfoController userInfoController = Get.put(
      UserInfoController(userService: UserService(httpClient: Dio())),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('QRCode'.tr),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<QrController>(
              init: qrController,
              builder: (controller) {
                final qrCodeData = controller.qrCodeData.value;
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.white,
                  child: QrImageView(
                    data: qrCodeData,
                    size: 200.0,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'RemainingTime'.tr + remainingSeconds.toString() + "second".tr,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
