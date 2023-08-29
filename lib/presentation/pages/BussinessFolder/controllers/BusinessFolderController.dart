import 'package:bc_keeper/data/models/BusinessFolder.dart';
import 'package:bc_keeper/presentation/pages/BussinessFolder/BusinessFolderService.dart';
import 'package:get/get.dart';

class BusinessFolderController extends GetxController {
  // Extend GetxController
  final BusinessFolderService businessFolderService;

  BusinessFolderController({required this.businessFolderService});

  final Rxn<List<BusinessFolder>> businessFolderList =
      Rxn<List<BusinessFolder>>(null);
  final Rx<RxStatus> status = Rx(RxStatus.loading());

  // Define a filtered list property to store the filtered results
  final Rx<List<BusinessFolder>> filteredList = Rx<List<BusinessFolder>>([]);

  void filterList(List<BusinessFolder> filtered) {
    filteredList.value = filtered;
  }

  Future<void> getMyHolderCards() async {
    status.value = RxStatus.loading();

    try {
      List<BusinessFolder> folderList =
          await businessFolderService.getMyHolderCards();
      businessFolderList.value = folderList;
      filteredList.value =
          folderList; // Filtrelenmiş liste başlangıçta tüm liste olarak ayarlanır

      status.value = RxStatus.success();
    } catch (error) {
      status.value = RxStatus.error(error.toString());
    }
  }
}
