import 'package:bc_keeper/app/routes/app_pages.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:bc_keeper/presentation/pages/Home/controllers/subscriber_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriberView extends StatelessWidget {
  final SubscriberController subscriberController =
      Get.find<SubscriberController>();
  final CardsController cardController = Get.find<CardsController>();

  @override
  Widget build(BuildContext context) {
    subscriberController.getCardSubscriber(
        cardId: cardController.cardList![cardController.currentIndex.value].id);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CardSubscribers'.tr)),
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: subscriberController.subscriberList.value?.length ?? 0,
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://api.bckeeper.com${subscriberController.subscriberList.value?[index].pictureurl ?? "empty.jpg"}'),
              ),
              title: Text(
                  subscriberController.subscriberList.value?[index].fullName ??
                      ""),
              subtitle: Text(subscriberController
                      .subscriberList.value?[index].companyname ??
                  ""),
              onTap: () {
                subscriberController.selectSubscriber(
                  subscriberController.subscriberList.value?[index],
                );
                Get.toNamed(Routes.HOME);
              },
            );
          },
        ),
      ),
    );
  }
}
