import 'package:bc_keeper/data/models/CardEdit.dart';
import 'package:bc_keeper/presentation/pages/BussinessFolder/controllers/BusinessFolderController.dart';
import 'package:get/get.dart';

import 'package:bc_keeper/data/providers/network/apis/card_service.dart';

import '../../../../data/models/BusinessCard.dart';

class CardsController extends GetxController {
  final CardService cardService;
  CardsController({
    required this.cardService,
  });
  final Rx<RxStatus> status = Rx<RxStatus>(RxStatus.empty());

  final RxBool _isSubscribersShared = false.obs;
  final Rxn<List<BusinessCard>> _cardList = Rxn<List<BusinessCard>>(null);
  final Rxn<CardEdit> _card = Rxn<CardEdit>(null);
  final Rxn<BusinessCard> currentCard = Rxn<BusinessCard>(null);
  var currentIndex = 0.obs;
  BusinessFolderController businessFolderController = Get.find();

  bool get isSubscribersShared => _isSubscribersShared.value;
  set isSubscribersShared(bool value) => _isSubscribersShared.value = value;

  List<BusinessCard>? get cardList => _cardList.value;
  set cardList(List<BusinessCard>? list) => {_cardList.value = list};

  CardEdit? get card => _card.value;
  set card(CardEdit? value) => _card.value = value;

  int get cardCount => cardList?.length ?? 1;

  Future<void> getMyCards() async {
    status.value = RxStatus.loading();
    cardList = await cardService.fetchMyCards();
    status.value = RxStatus.success();
  }

  Future<void> updateCard() async {
    status.value = RxStatus.loading();
    try {
      if (currentCard.value != null) {
        // Update the name of the current card with the new name

        var result = await cardService.updateCard(currentCard.value!);

        if (result) {
          Get.snackbar(
            'Succesful:'.tr, // Snackbar başlığı
            'CardInfoChanged'.tr, // Snackbar içeriği
          );
        } else {
          Get.snackbar(
            'Error:'.tr, // Snackbar başlığı
            'Cardisnotupdated!!'.tr, // Snackbar içeriği
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error:'.tr, // Snackbar başlığı
        'CardNotUpdated'.tr, // Snackbar içeriği
      );
    }

    status.value = RxStatus.success();
  }

  Future<void> markCardFav(int id) async {
    status.value = RxStatus.loading();
    int index = 0;
    for (int i = 0;
        i < businessFolderController.businessFolderList.value!.length;
        i++) {
      if (businessFolderController.businessFolderList.value?[i].id == id) {
        index = i;
        break;
      }
    }
    bool isFavorited =
        !(businessFolderController.businessFolderList.value?[index].favorite ??
            true);
    cardService.markCardFav(id, isFavorited);
    status.value = RxStatus.success();
  }

  Future<void> forwardCard(
      {required int id,
      required int receiverUserId,
      required int receiverCardId}) async {
    status.value = RxStatus.loading();
    try {
      var success =
          await cardService.forwardCard(id, receiverUserId, receiverCardId);

      if (success) {
        Get.snackbar(
          'Success:',
          'Card has been forwarded successfully.',
        );

        // Refresh card list after forwarding
        await getMyCards();
      } else {
        Get.snackbar(
          'Error:'.tr,
          'Failed to forward the card.',
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error:'.tr,
        error.toString(),
      );
    }
  }
}
