import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/Subscriber.dart';
import '../../../../data/providers/network/apis/subscriber_service.dart';

class SubscriberController {
  final SubscriberService subscriberService;

  SubscriberController({required this.subscriberService});

  final Rxn<List<Subscriber>> subscriberList = Rxn<List<Subscriber>>(null);
  final Rx<RxStatus> status = Rx(RxStatus.loading());

  Rxn<Subscriber>? selectedSubscriber = Rxn<Subscriber>();

  Future<void> getCardSubscriber({required int? cardId}) async {
    status.value = RxStatus.loading();
    if (cardId != null) {
      subscriberList.value = await subscriberService.fetchSubscriber(cardId);
    } else {
      Get.snackbar(
        'Hata:', // Snackbar başlığı
        'Kart Yok !!', // Snackbar içeriği
      );
    }
    status.value = RxStatus.success();
  }

  void selectSubscriber(Subscriber? subscriber) {
    selectedSubscriber!.value = subscriber;
  }
}
