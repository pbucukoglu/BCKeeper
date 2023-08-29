import 'package:bc_keeper/data/models/User.dart';
import 'package:bc_keeper/presentation/pages/Auth/LoginView.dart';
import 'package:bc_keeper/presentation/pages/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'app/bindings/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/dark_theme.dart';
import 'app/themes/light_theme.dart';
import 'app/translations/app_translations.dart';
import 'app/types/authentication/auth_state.dart';
import 'data/providers/network/apis/auth_service.dart';
import 'data/providers/network/dio_interceptor.dart';
import 'presentation/global_controllers/auth/auth_controller.dart';

void main() async {
  var instance = WidgetsFlutterBinding.ensureInitialized();
  print(instance.toString());
  final dir = await getApplicationSupportDirectory();

  runApp(App());

  Isar.open([UserSchema], directory: dir.path, inspector: true);

  var translation = AppTranslation();
  translation.changeLocale(translation.getDeviceLocale()?.languageCode ?? "tr");
  // translation.changeLocale("en");
}

class App extends GetWidget<AuthController> {
  App({super.key});
  @override
  final controller = Get.put<AuthController>(
      AuthController(service: AuthService(httpClient: getInstance())));

  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (event) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          }
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.INITIAL,
          initialBinding: InitialBindings(),
          theme: lightThemeData,
          darkTheme: darkThemeData,
          defaultTransition: Transition.cupertino,
          getPages: AppPages.pages,
          themeMode: ThemeMode.system,
          localizationsDelegates: const <LocalizationsDelegate<Object>>[
            // ... app-specific localization delegate(s) here
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: Obx(() {
            if (controller.authState is Authenticated) {
              return HomeView();
            } else {
              return LoginView();
            }
          }),
          translationsKeys: AppTranslation.keys,
          locale: Get.locale,
        ));
  }
}
