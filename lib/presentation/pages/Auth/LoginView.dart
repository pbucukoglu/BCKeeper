import 'package:bc_keeper/presentation/pages/Auth/controllers/login_controller.dart';
import 'package:bc_keeper/presentation/widgets/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/TextInput.dart' as LocalTextInput;

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bool _loginControllerRegistered = Get.isRegistered<LoginController>();
  LoginController? loginController;

  @override
  void initState() {
    super.initState();
    loginController =
        _loginControllerRegistered ? Get.find() : Get.put(LoginController());
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        DeviceOrientation.values); // Orijinallere geri dön
    super.dispose();
  }

  void _handleLogin() {
    // Perform login actions here
    loginController?.login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ClipOval(
                child: Image.asset(
                  'assets/login.jpg',
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  "Login".tr,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              LocalTextInput.TextInput(
                controller: loginController!.emailTextController,
                hintText: "username".tr,
                icon: Icons.person,
              ),
              SizedBox(height: 10),
              LocalTextInput.TextInput(
                controller: loginController!.passwordTextController,
                hintText: "password".tr,
                icon: Icons.lock,
                isPassword: true,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 24),
                  Icon(Icons.warning, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "SignInPrivacyMessage".tr,
                        style: GoogleFonts.fjordOne(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppButton(
                  buttonText: 'Login'.tr,
                  onPressed: _handleLogin,
                ),
              ),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Şifremi Unuttum işlemleri burada yapılabilir
                    },
                    child: Text(
                      'ForgotPassword'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Kayıt Ol işlemleri burada yapılabilir
                    },
                    child: Text(
                      'SignUp'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
