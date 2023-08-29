// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bc_keeper/presentation/pages/Account/ChangePasswordView.dart';
import 'package:bc_keeper/presentation/pages/Account/UserInfoView.dart';
import 'package:bc_keeper/presentation/pages/Auth/PersonCard/PersonCardView.dart';
import 'package:bc_keeper/presentation/pages/Auth/ShareCard/CardSharingView.dart';
import 'package:bc_keeper/presentation/pages/BussinessFolder/BusinessFolderView.dart';
import 'package:bc_keeper/presentation/pages/Card/CardEditView.dart';
import 'package:bc_keeper/presentation/pages/ForwardingCard/ForwardCardView.dart';
import 'package:bc_keeper/presentation/pages/Home/Qr/QrView.dart';
import 'package:bc_keeper/presentation/pages/Home/Subscriber/SubscriberView.dart';
import 'package:bc_keeper/presentation/pages/Home/home.dart';
import 'package:bc_keeper/presentation/pages/Notification/NotificationView.dart';
import 'package:bc_keeper/presentation/pages/Social%20Medias/SocialMediaView.dart';

import '../../presentation/pages/Account/AccountView.dart';
import '../../presentation/pages/Auth/LoginView.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginView()),
    GetPage(name: Routes.ACCOUNT, page: () => AccountView()),
    GetPage(name: Routes.HOME, page: () => HomeView()),
    GetPage(name: Routes.SIGNOUT, page: () => LoginView()),
    GetPage(
      name: Routes.SUBSCRIBER,
      page: () => SubscriberView(), // Provide the required cardId
    ),
    GetPage(name: Routes.QR, page: () => QrView()),
    GetPage(name: Routes.CARDEDIT, page: () => CardEditView()),
    GetPage(name: Routes.CHANGEPASSWORD, page: () => ChangePasswordView()),
    GetPage(name: Routes.USERINFO, page: () => UserInfoView()),
    GetPage(name: Routes.BUSINESSCARD, page: () => BusinessFolderView()),
    GetPage(name: Routes.PERSONCARD, page: () => PersonCardView()),
    GetPage(name: Routes.SOCIALMEDIA, page: () => SocialMediaView()),
    GetPage(name: Routes.SHARECARD, page: () => CardSharingView()),
    GetPage(name: Routes.FORWARDCARD, page: () => ForwardCardView()),
    GetPage(name: Routes.NOTIFICATIONS, page: () => NotificationView()),
  ];
}
