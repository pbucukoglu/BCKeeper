import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:flutter/material.dart';

class Kartvisit extends StatelessWidget {
  const Kartvisit({
    Key? key,
    required this.cardController,
  }) : super(key: key);

  final CardsController cardController;

  @override
  Widget build(BuildContext context) {
    final currentCard =
        cardController.cardList?[cardController.currentIndex.value];
    final fullName = currentCard?.fullname;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 2),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(children: [
                SizedBox(
                  width: 120,
                  child: Image.network(
                    'https://api.bckeeper.com${currentCard?.logoURLPath}${currentCard?.logourl1}',
                  ),
                ),
              ]),
              Text(
                currentCard?.webaddress ?? "web adresi çekemedin",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(fullName ?? "Boş",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(currentCard?.title1 ?? currentCard?.title2 ?? "",
              style: TextStyle(
                fontSize: 18,
              )),
          SizedBox(
            height: 25,
          ),
          Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentCard?.companyName ?? "ismi çekemedin",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Adres-1: ${currentCard?.address1}" ?? "adresi çekemedin",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Adres-2: ${currentCard?.address2}" ?? "adresi çekemedin",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Adres-3: ${currentCard?.address3}" ?? "adresi çekemedin",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Telefon:${currentCard?.t1}    Faks: ${currentCard?.f}" ??
                    "telefon numarası çekemedin",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "e-posta: ${currentCard?.email}" ?? "email adresi çekemedin",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
