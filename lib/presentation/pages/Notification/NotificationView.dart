import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:bc_keeper/presentation/pages/Notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);
  final NotificationsController notificationsController =
      Get.find<NotificationsController>();
  final CardsController cardController = Get.find<CardsController>();
  @override
  Widget build(BuildContext context) {
    notificationsController.getNotifications();
    final Locale currentLocale = Get.locale!;
    final bool isTurkish = currentLocale.languageCode == 'tr';

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                itemCount:
                    notificationsController.notificationsList.value?.length ??
                        0,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  final notification =
                      notificationsController.notificationsList.value?[index];
                  final String cardForwarderUsername =
                      notification?.cardforwarderusername ?? '';
                  final String receiverUsername =
                      notification?.receiverusername ?? '';

                  String message = '';

                  if (notification?.notificationType == 1) {
                    message = isTurkish
                        ? '$cardForwarderUsername kartınızı $receiverUsername isimli kullanıcıya iletti'
                        : '$cardForwarderUsername forwarded your card to $receiverUsername';
                  } else if (notification?.notificationType == 2) {
                    message = isTurkish
                        ? '$receiverUsername kartvizitini güncelledi!'
                        : '$receiverUsername updated his/her businesscard';
                  }

                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(message),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
