import 'package:bc_keeper/data/models/BusinessFolder.dart';
import 'package:bc_keeper/presentation/pages/Auth/PersonCard/PersonCardController.dart';
import 'package:bc_keeper/presentation/pages/BussinessFolder/controllers/BusinessFolderController.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForwardCardView extends StatelessWidget {
  final BusinessFolderController businessFolderController =
      Get.find<BusinessFolderController>();
  final TextEditingController searchController = TextEditingController();
  final CardsController cardsController = Get.find();
  final PersonCardController personCardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text("ForwardCard".tr),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (_) {
                // We filter the list here
                final folderList =
                    businessFolderController.businessFolderList.value;
                final filteredList = folderList!.where((person) {
                  final fullName = person.fullName?.toLowerCase() ?? '';
                  final companyname = person.companyname?.toLowerCase() ?? '';
                  return fullName
                          .contains(searchController.text.toLowerCase()) ||
                      companyname.contains(searchController.text.toLowerCase());
                }).toList();
                businessFolderController.filterList(filteredList);
              },
              decoration: InputDecoration(
                hintText: 'SearchCompany'.tr,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final folderList = businessFolderController.filteredList.value;

              if (searchController.text.isEmpty) {
                return Container();
              } else if (folderList.isEmpty) {
                return Center(
                  child: Text("NoPersonFound".tr),
                );
              } else {
                return ListView.separated(
                  itemCount: folderList.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey),
                  itemBuilder: (context, index) {
                    final person = folderList[index];
                    final starColor =
                        person.favorite ? Colors.yellow[600] : Colors.white;

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://api.bckeeper.com/${person.picturepath ?? ""}/${person.pictureurl ?? "empty.jpg"}',
                        ),
                      ),
                      trailing: Icon(
                        Icons.star,
                        color: starColor,
                      ),
                      title: Text(person.fullName ?? ""),
                      subtitle: Text(person.companyname ?? ""),
                      onTap: () async {
                        await _forwardCard(person.id!, person.userid!);
                      },
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  Future<void> _forwardCard(int cardId, int userId) async {
    await cardsController.forwardCard(
      id: personCardController.currentCard.value!.id!,
      receiverUserId: userId,
      receiverCardId: cardId,
    );
  }
}
