import 'package:bc_keeper/presentation/pages/Auth/PersonCard/PersonCardService.dart';
import 'package:get/get.dart';
import '../../../../data/models/BusinessCard.dart';

class PersonCardController extends GetxController {
  final PersonCardService personCardService;
  PersonCardController({
    required this.personCardService,
  });

  final Rx<RxStatus> status = Rx<RxStatus>(RxStatus.empty());
  final Rxn<BusinessCard> currentCard = Rxn<BusinessCard>(null);
  RxBool get titleSwitch => _titleSwitch;
  final RxBool _titleSwitch = RxBool(false);
  RxBool get phoneSwitch => _phoneSwitch;
  final RxBool _phoneSwitch = RxBool(false);
  RxBool get mobileSwitch => _mobileSwitch;
  final RxBool _mobileSwitch = RxBool(false);
  var currentIndex = 0.obs;

  Future<void> getHolderCardById(int id) async {
    status.value = RxStatus.loading();
    currentCard.value = await personCardService.getHolderCardById(id);
    status.value = RxStatus.success();
  }
}
