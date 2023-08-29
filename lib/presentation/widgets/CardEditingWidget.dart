import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:bc_keeper/presentation/widgets/NameWidget.dart';

class CardEditingWidget extends StatelessWidget {
  const CardEditingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CardsController cardsController = Get.find();
    final ImagePicker _imagePicker = ImagePicker();

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            cardsController.currentCard.value!.logourl1 == null &&
                    cardsController.currentCard.value?.logourl2 == null &&
                    cardsController.currentCard.value?.logourl3 == null
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Logos'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.grey,
                      ),
                      if (cardsController.currentCard.value?.logourl1 != null)
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Logo-1",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Obx(
                              () =>
                                  (cardsController.currentCard.value != null &&
                                          cardsController.currentCard.value!
                                                  .logourl1 !=
                                              null &&
                                          cardsController
                                              .currentCard.value!.logourl1!
                                              .startsWith("/data"))
                                      ? SizedBox(
                                          child: Image.file(
                                            File(cardsController
                                                .currentCard.value!.logourl1!),
                                            height: 100,
                                            width: 100,
                                          ),
                                        )
                                      : SizedBox(
                                          child: Image.network(
                                            'https://api.bckeeper.com/Logolar/${cardsController.currentCard.value?.logourl1}',
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                            ),
                            Spacer(),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () async {
                                final pickedFile = await _imagePicker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (pickedFile != null) {
                                  cardsController.currentCard.value?.logourl1 =
                                      pickedFile.path;
                                  cardsController.currentCard.refresh();
                                }
                              },
                              child: Text(
                                'Change'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                      if (cardsController.currentCard.value?.logourl2 != null)
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Logo-2",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Obx(
                              () =>
                                  (cardsController.currentCard.value != null &&
                                          cardsController.currentCard.value!
                                                  .logourl2 !=
                                              null &&
                                          cardsController
                                              .currentCard.value!.logourl2!
                                              .startsWith("/data"))
                                      ? SizedBox(
                                          child: Image.file(
                                            File(cardsController
                                                .currentCard.value!.logourl2!),
                                            height: 100,
                                            width: 100,
                                          ),
                                        )
                                      : SizedBox(
                                          child: Image.network(
                                            'https://api.bckeeper.com/Logolar/${cardsController.currentCard.value?.logourl2}',
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                            ),
                            Spacer(),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () async {
                                final pickedFile = await _imagePicker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (pickedFile != null) {
                                  cardsController.currentCard.value?.logourl2 =
                                      pickedFile.path;
                                  cardsController.currentCard.refresh();
                                }
                              },
                              child: Text(
                                'Change'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                      if (cardsController.currentCard.value?.logourl3 != null)
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Logo-3",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Obx(
                              () =>
                                  (cardsController.currentCard.value != null &&
                                          cardsController.currentCard.value!
                                                  .logourl3 !=
                                              null &&
                                          cardsController
                                              .currentCard.value!.logourl3!
                                              .startsWith("/data"))
                                      ? SizedBox(
                                          child: Image.file(
                                            File(cardsController
                                                .currentCard.value!.logourl3!),
                                            height: 100,
                                            width: 100,
                                          ),
                                        )
                                      : SizedBox(
                                          child: Image.network(
                                            'https://api.bckeeper.com/Logolar/${cardsController.currentCard.value?.logourl3}',
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                            ),
                            Spacer(),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () async {
                                final pickedFile = await _imagePicker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (pickedFile != null) {
                                  cardsController.currentCard.value?.logourl3 =
                                      pickedFile.path;
                                  cardsController.currentCard.refresh();
                                }
                              },
                              child: Text(
                                'Change'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                    ],
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'FullName'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.fullname == null
                ? CircularProgressIndicator()
                : Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        cardsController.currentCard.value?.fullname ?? "",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Titles'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.title1 == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.title1,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.title1 = newName;
                    }),
                  ),
            cardsController.currentCard.value?.title2 == null
                ? CircularProgressIndicator()
                : NameWidget(
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.title2 = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Department'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.department == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.department,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.department = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'CompanyName'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.companyName == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.companyName,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.companyName = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'District'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.district == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.district,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.district = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Country'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.country == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.country,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.country = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'FaxNo'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.f == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.f,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.f = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'E-mail'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.email == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.email,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.email = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'ZipCode'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.zipcode == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.zipcode,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.zipcode = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'City'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            cardsController.currentCard.value?.city == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.city,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.city = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Addresses'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            cardsController.currentCard.value?.address1 == null
                ? CircularProgressIndicator()
                : // or any other loading widget
                NameWidget(
                    initialName: cardsController.currentCard.value?.address1,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.address1 = newName;
                    }),
                  ),
            cardsController.currentCard.value?.address2 == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.address2,
                    onChanged: (newName) =>
                        cardsController.currentCard.value?.address2 = newName,
                  ),
            cardsController.currentCard.value?.address3 == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.address3,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.address3 = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Telephones'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            cardsController.currentCard.value?.t1 == null
                ? CircularProgressIndicator()
                : // or any other loading widget
                NameWidget(
                    initialName: cardsController.currentCard.value?.t1,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.t1 = newName;
                    }),
                  ),
            cardsController.currentCard.value?.t2 == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.t2,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.t2 = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'MobilePhones'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey,
            ),
            cardsController.currentCard.value?.m1 == null
                ? CircularProgressIndicator()
                : // or any other loading widget
                NameWidget(
                    initialName: cardsController.currentCard.value?.m1,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.m1 = newName;
                    }),
                  ),
            cardsController.currentCard.value?.m2 == null
                ? CircularProgressIndicator()
                : NameWidget(
                    initialName: cardsController.currentCard.value?.m2,
                    onChanged: (newName) =>
                        cardsController.currentCard.update((val) {
                      val?.m2 = newName;
                    }),
                  ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
