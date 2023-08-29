import 'package:bc_keeper/presentation/pages/Home/Subscriber/SubscriberView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bc_keeper/app/routes/app_pages.dart';
import 'package:bc_keeper/data/models/Subscriber.dart';
import 'package:bc_keeper/presentation/global_controllers/auth/auth_controller.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/template_controller.dart';
import 'package:bc_keeper/presentation/pages/Home/controllers/sharing_controller.dart';
import 'package:bc_keeper/presentation/widgets/TemplateCardWidget.dart';

import '../../widgets/CustomDrawer.dart';

class HomeView extends StatefulWidget {
  final Subscriber? subscriber;

  const HomeView({Key? key, this.subscriber}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AuthController authController;
  late CardsController cardController;
  late TemplateController templateController;
  late SharingController sharingController;
  PageController pageController = PageController(initialPage: 0);
  int currentCardIndex = 0;
  bool shareSubscribers = false;
  Subscriber? selectedSubscriber;

  @override
  void initState() {
    authController = Get.find<AuthController>();
    cardController = Get.find<CardsController>();
    templateController = Get.find<TemplateController>();
    sharingController = Get.find<SharingController>();
    cardController.getMyCards().then((_) {
      cardController.currentCard.value =
          cardController.cardList?[cardController.currentIndex.value];
      templateController
          .fetchTemplate(cardController.currentCard.value?.templateid ?? 0)
          .then((_) {});
    });
    currentCardIndex = cardController.currentIndex.value;
    pageController = PageController(initialPage: currentCardIndex);
    selectedSubscriber = widget.subscriber;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextCard() async {
    int newIndex = (currentCardIndex + 1) % cardController.cardCount;
    updateCurrentCardIndex(newIndex);
    pageController.animateToPage(
      newIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToPreviousCard() async {
    int newIndex = (currentCardIndex - 1 + cardController.cardCount) %
        cardController.cardCount;
    updateCurrentCardIndex(newIndex);
    pageController.animateToPage(
      newIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> markCardForward(bool forward) async {
    final currentCard =
        cardController.cardList?[cardController.currentIndex.value];
    if (currentCard != null) {
      try {
        await sharingController.markCardForward(currentCard.id!, forward);
      } catch (error) {
        print('Error marking card forward: $error');
      }
    }
  }

  void updateCurrentCardIndex(int newIndex) {
    setState(() {
      currentCardIndex = newIndex;
      cardController.currentIndex.value = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 90.0),
                  child: Text(
                    "BusinessCards".tr,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: CustomDrawer(),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Obx(() => cardController.status.value.isSuccess ==
                            false &&
                        templateController.selectedTemplate.value == null &&
                        templateController.templates.value == null
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Center(
                        child: AspectRatio(
                          aspectRatio: 8.5 / 5,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final cardWidth = constraints.maxWidth;
                              final cardHeight = constraints.maxHeight;

                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: PageView.builder(
                                    controller: pageController,
                                    itemCount:
                                        cardController.cardList?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final card =
                                          cardController.cardList?[index];

                                      return TemplateCardWidget(
                                        cardWidth: cardWidth,
                                        cardHeight: cardHeight,
                                        templateWidth: templateController.W,
                                        card: card,
                                        templateHierarchy: templateController
                                            .selectedTemplate.value?.hierarchy,
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: goToPreviousCard,
                          ),
                          SizedBox(width: 8),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: goToNextCard,
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SubShared".tr,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Switch(
                              value: shareSubscribers,
                              activeColor: Colors.green,
                              onChanged: (value) async {
                                setState(() {
                                  shareSubscribers = value;
                                });

                                try {
                                  await markCardForward(value);
                                  if (value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('CardForwardSuccess'.tr),
                                        behavior: SnackBarBehavior.fixed,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('CardForwardCancel'.tr),
                                        behavior: SnackBarBehavior.fixed,
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  print('Error marking card forward: $error');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Kart forward işlemi sırasında bir hata oluştu.'
                                              .tr),
                                      behavior: SnackBarBehavior.fixed,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      selectedSubscriber != null
                          ? ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://api.bckeeper.com${selectedSubscriber?.pictureurl ?? "empty.jpg"}'),
                              ),
                              title: Text(selectedSubscriber?.fullName ?? ""),
                              subtitle:
                                  Text(selectedSubscriber?.companyname ?? ""),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.create),
                  onPressed: () {
                    Get.toNamed(Routes.CARDEDIT);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.qr_code),
                  onPressed: () {
                    Get.toNamed(Routes.QR);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.people),
                  onPressed: () {
                    Get.to(
                        SubscriberView()); // Subscriberview sayfasına yönlendirme
                  },
                ),
              ],
            ),
          ),
        );
      } else if (orientation == Orientation.landscape) {
        return Scaffold(
          drawer: CustomDrawer(),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Obx(() => cardController.status.value.isSuccess ==
                              false &&
                          templateController.selectedTemplate.value == null &&
                          templateController.templates.value == null
                      ? Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Center(
                          child: AspectRatio(
                            aspectRatio:
                                (templateController.W) / (templateController.H),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final cardWidth = constraints.maxWidth;
                                final cardHeight = constraints.maxHeight;

                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: PageView.builder(
                                      controller: pageController,
                                      itemCount:
                                          cardController.cardList?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final card =
                                            cardController.cardList?[index];

                                        return TemplateCardWidget(
                                          cardWidth: cardWidth,
                                          cardHeight: cardHeight,
                                          templateWidth: templateController.W,
                                          card: card,
                                          templateHierarchy: templateController
                                              .selectedTemplate
                                              .value
                                              ?.hierarchy,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )),
                ),
              ],
            ),
          ),
        );
      } else {
        // Handle other orientations or cases
        return Center(
          child: Text("Unsupported Orientation"),
        );
      }
    });
  }
}
