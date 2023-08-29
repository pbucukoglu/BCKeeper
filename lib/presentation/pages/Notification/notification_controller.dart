// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bc_keeper/data/models/Notifications.dart';
import 'package:get/get.dart';

import 'package:bc_keeper/presentation/pages/Notification/notification_service.dart';

class NotificationsController extends GetxController {
  NotificationService notificationService;

  NotificationsController({
    required this.notificationService,
  });
  final Rx<RxStatus> status = Rx(RxStatus.loading());
  final Rxn<List<Notifications>> notificationsList =
      Rxn<List<Notifications>>(null);

  Future<void> getNotifications() async {
    status.value = RxStatus.loading();

    try {
      List<Notifications> folderList =
          await notificationService.getNotifications();
      notificationsList.value = folderList;

      status.value = RxStatus.success();
    } catch (error) {
      status.value = RxStatus.error(error.toString());
    }
  }
}
