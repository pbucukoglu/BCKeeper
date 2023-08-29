import 'package:bc_keeper/app/routes/app_pages.dart';
import 'package:bc_keeper/data/models/BusinessFolder.dart';
import 'package:bc_keeper/presentation/pages/Auth/PersonCard/PersonCardView.dart';
import 'package:bc_keeper/presentation/pages/BussinessFolder/controllers/BusinessFolderController.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessFolderView extends StatelessWidget {
  BusinessFolderView({Key? key}) : super(key: key);
  final BusinessFolderController businessFolderController =
      Get.find<BusinessFolderController>();
  final CardsController cardController = Get.find<CardsController>();

  // Function to filter the list based on search query
  List<BusinessFolder> _filterList(String query) {
    if (query.isEmpty) {
      return businessFolderController.businessFolderList.value!;
    } else {
      query = query.toLowerCase();
      return businessFolderController.businessFolderList.value!.where((folder) {
        return folder.fullName!.toLowerCase().contains(query) ||
            folder.companyname!.toLowerCase().contains(query);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    businessFolderController.getMyHolderCards();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) =>
                  businessFolderController.filterList(_filterList(query)),
              decoration: InputDecoration(
                hintText: 'SearchCompany'.tr,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                itemCount: businessFolderController.filteredList.value.length,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  final folder =
                      businessFolderController.filteredList.value[index];
                  // final card = cardController.currentCard.value;

                  // Determine the color of the star icon
                  final starColor = folder.favorite == true
                      ? Colors.yellow[600]
                      : Colors.white;
                  print("basıldı:${folder.favorite}");

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://api.bckeeper.com/${folder.picturepath ?? ""}/${folder.pictureurl ?? "empty.jpg"}',
                      ),
                    ),
                    trailing: Icon(
                      Icons.star,
                      color: starColor, // Set the determined color here
                    ),
                    title: Text(folder.fullName ?? ""),
                    subtitle: Text(folder.companyname ?? ""),
                    onTap: () => _onPersonCardTap(context, folder),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPersonCardTap(BuildContext context, BusinessFolder folder) {
    int id = folder.id ?? 0;
    String path = folder.picturepath.toString();
    String url = folder.pictureurl.toString();

    Get.toNamed(
      Routes.PERSONCARD,
      arguments: {'id': id, 'path': path, "url": url},
    );
  }
}
