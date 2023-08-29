import 'package:bc_keeper/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../global_controllers/auth/auth_controller.dart';
import '../pages/Card/controllers/cards_controller.dart';
import '../pages/Notification/notification_controller.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    Key? key,
  }) : super(key: key);

  final AuthController authController = Get.find();
  final CardsController cardsController = Get.find();
  final RxString pictureUrl = ''.obs;
  final Locale? systemLocale = Get.locale;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                height: 200,
                child: Center(
                  child: Obx(() {
                    final user = authController.user.value;
                    final premiumExpires = user?.premiumExpires;
                    final premiumExpiresDate =
                        DateTime.tryParse(premiumExpires ?? '');
                    final formattedPremiumExpires = premiumExpiresDate != null
                        ? DateFormat('d MMMM y', systemLocale?.toLanguageTag())
                            .format(premiumExpiresDate)
                        : '';
                    final picturePath = user?.picturepath ?? '';
                    final newPictureUrl = user?.pictureurl ?? 'empty.jpg';

                    if (newPictureUrl.isNotEmpty) {
                      pictureUrl.value = '$picturePath$newPictureUrl';
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://api.bckeeper.com/${user?.picturepath}${user?.pictureurl ?? "empty.jpg"}',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${user?.name ?? ''} ${user?.surname ?? ''}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          user?.isPremium == true
                              ? 'PremiumUser'.tr
                              : 'NormalUser'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        if (user?.isPremium == true)
                          Text(
                            '${'PremiumExpires:'.tr} $formattedPremiumExpires',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('MyBusinessCards'.tr),
                onTap: () {
                  cardsController.getMyCards();
                  Get.offAllNamed(Routes.HOME);
                },
                tileColor: Colors.grey[200],
                leading: Icon(Icons.credit_card),
              ),
              ListTile(
                title: Text('BusinessCardFolder'.tr),
                onTap: () {
                  Get.toNamed(Routes.BUSINESSCARD);
                },
                tileColor: Colors.grey[200],
                leading: Icon(Icons.folder),
              ),
              Obx(() {
                final notificationsController =
                    Get.find<NotificationsController>();
                final notificationsList =
                    notificationsController.notificationsList.value;
                int unseenNotificationsCount = 0;
                if (notificationsList != null) {
                  for (final notification in notificationsList) {
                    if (notification.seen != null && !notification.seen!) {
                      unseenNotificationsCount++;
                    }
                  }
                }
                return ListTile(
                  title: Row(
                    children: [
                      Text('Notifications'.tr),
                      if (unseenNotificationsCount > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 12,
                            child: Text(
                              '$unseenNotificationsCount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Get.toNamed(Routes.NOTIFICATIONS);
                  },
                  tileColor: Colors.grey[200],
                  leading: Icon(Icons.notifications),
                );
              }),
              ListTile(
                title: Text('MyAccount'.tr),
                onTap: () {
                  Get.toNamed(Routes.ACCOUNT);
                },
                tileColor: Colors.grey[200],
                leading: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text('SignOut'.tr),
                onTap: () {
                  authController.signOut();
                  Get.offAndToNamed(Routes.SIGNOUT);
                },
                tileColor: Colors.grey[200],
                leading: Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
