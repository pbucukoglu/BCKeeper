import 'package:get/get.dart';

import 'package:bc_keeper/data/models/BusinessFolder.dart';
import 'package:bc_keeper/data/providers/network/apis/subscriber_service.dart';
import 'package:bc_keeper/data/providers/network/apis/template_service.dart';
import 'package:bc_keeper/data/providers/network/dio_interceptor.dart';
import 'package:bc_keeper/presentation/pages/Auth/PersonCard/PersonCardController.dart';
import 'package:bc_keeper/presentation/pages/Auth/PersonCard/PersonCardService.dart';
import 'package:bc_keeper/presentation/pages/BussinessFolder/BusinessFolderService.dart';
import 'package:bc_keeper/presentation/pages/BussinessFolder/controllers/BusinessFolderController.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/template_controller.dart';
import 'package:bc_keeper/presentation/pages/Home/controllers/sharing_controller.dart';
import 'package:bc_keeper/presentation/pages/Home/controllers/subscriber_controller.dart';
import 'package:bc_keeper/presentation/pages/Notification/notification_controller.dart';
import 'package:bc_keeper/presentation/pages/Notification/notification_service.dart';

import '../../data/providers/network/apis/auth_service.dart';
import '../../data/providers/network/apis/card_service.dart';
import '../../presentation/global_controllers/auth/auth_controller.dart';
import '../../presentation/pages/Card/controllers/cards_controller.dart';

class InitialBindings implements Bindings {
  var dio = getInstance();
  @override
  void dependencies() {
    Get.lazyPut(
        () => CardsController(
            cardService: CardService(
                httpClient:
                    getInstance(Get.find<AuthController>().user.value?.token),
                user: Get.find<AuthController>().user.value)),
        fenix: true);

    Get.lazyPut(
        () => SubscriberController(
            subscriberService: SubscriberService(
                httpClient:
                    getInstance(Get.find<AuthController>().user.value?.token),
                user: Get.find<AuthController>().user.value)),
        fenix: true);

    Get.lazyPut(
        () => SharingController(
            sharingService: CardService(
                httpClient:
                    getInstance(Get.find<AuthController>().user.value?.token),
                user: Get.find<AuthController>().user.value)),
        fenix: true);

    Get.lazyPut(
        () => TemplateController(
            templateService: TemplateService(
                httpClient:
                    getInstance(Get.find<AuthController>().user.value?.token),
                user: Get.find<AuthController>().user.value)),
        fenix: true);
    Get.lazyPut(
        () => BusinessFolderController(
            businessFolderService: BusinessFolderService(
                httpClient:
                    getInstance(Get.find<AuthController>().user.value?.token),
                user: Get.find<AuthController>().user.value)),
        fenix: true);
    Get.lazyPut(
        () => PersonCardController(
            personCardService: PersonCardService(
                httpClient:
                    getInstance(Get.find<AuthController>().user.value?.token),
                user: Get.find<AuthController>().user.value)),
        fenix: true);
    Get.lazyPut(
        () => NotificationsController(
            notificationService: NotificationService(
                httpClient:
                    getInstance(Get.find<AuthController>().user.value?.token),
                user: Get.find<AuthController>().user.value)),
        fenix: true);
  }
}
