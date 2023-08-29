import 'dart:async';

import 'package:get/get.dart';

import '../../../../data/providers/network/apis/user_services.dart';

class QrController extends GetxController {
  final UserService userService;

  RxString qrCodeData = ''.obs;
  Timer? timer;

  QrController({required this.userService});

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    stopTimer();
  }

  Future<void> generateNewQRCode(int cardId) async {
    // QR kodunun oluşturulması için gerekli işlemler burada gerçekleştirilir
    qrCodeData.value = 'Yeni QR Kod Verisi';
    startTimer();
  }

  void startTimer() {
    stopTimer(); // Timer'ı durdur ve sıfırla
    timer = Timer(Duration(seconds: 180), () {
      // Timer tamamlandığında yapılacak işlemler burada gerçekleştirilir
    });
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }
}
