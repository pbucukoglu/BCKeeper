import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/instance_manager.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app/types/authentication/auth_state.dart';
import '../../../presentation/global_controllers/auth/auth_controller.dart';
import '../../models/User.dart';
import 'apis/auth_service.dart';

Dio getInstance([String? accessToken]) {
  Dio dio = Dio();
  (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
      (HttpClient dioClient) {
    dioClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    return dioClient;
  };
  dio = Dio(BaseOptions(
    baseUrl: 'https://api.bckeeper.com/',
    connectTimeout: Duration(milliseconds: 3000),
  ));

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    var token = Get.find<AuthController>().token;
    if (accessToken == null && token != null) accessToken = token;
    if (accessToken != null) {
      Isar? isar = Isar.getInstance();
      User? user;
      final dir = await getApplicationDocumentsDirectory();

      isar ??= await Isar.open([UserSchema], directory: dir.path);

      var users = await isar.users.where().findAll();
      if (users.isNotEmpty) user = users.last;
      // if (accessToken != user?.token) accessToken = user?.token;
      options.headers['Authorization'] = 'Bearer $accessToken';
      if (user?.cultureinfo != null) {
        options.headers['culinfo'] = user?.cultureinfo ?? "tr";
      }
    }
    options.followRedirects = false;
    options.validateStatus = (status) => status! <= 500;
    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    options.headers[HttpHeaders.acceptCharsetHeader] = 'UTF-8';
    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';

    return handler.next(options);
  }, onResponse:
      (Response<dynamic> e, ResponseInterceptorHandler handler) async {
    if (e.statusCode == 401) {
      if (!Get.isRegistered<AuthController>()) {
        Get.put<AuthController>(
            AuthController(service: AuthService(httpClient: dio)));
      }
      AuthController controller = Get.find<AuthController>();
      if (controller.authState is Authenticated) {
        await controller.signOut(true);
        Isar? isar = Isar.getInstance();
        User? user;
        final dir = await getApplicationDocumentsDirectory();

        isar ??= await Isar.open([UserSchema], directory: dir.path);

        user = await isar.users.filter().tokenIsNotEmpty().findFirst();
        if (user != null) {
          user.token = "";
          await isar.writeTxn(() async {
            await isar?.users.put(user!);
          });
        }
      }
    }
    return handler.next(e);
  }, onError: (DioError e, handler) async {
    return handler.next(e);
  }));
  return dio;
}
