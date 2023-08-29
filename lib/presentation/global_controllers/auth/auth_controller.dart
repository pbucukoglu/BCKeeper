import 'package:bc_keeper/data/models/Subscriber.dart';
import 'package:bc_keeper/data/providers/network/dio_interceptor.dart';
import 'package:bc_keeper/presentation/pages/Notification/notification_service.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app/types/authentication/auth_state.dart';
import '../../../data/models/User.dart';
import '../../../data/providers/network/apis/auth_service.dart';

class AuthController extends GetxController {
  final AuthService service;

  AuthController({required this.service});

  final Rx<AuthState> _authenticationStateStream = AuthState().obs;
  Rxn<User> user = Rxn<User>();

  AuthState get authState => _authenticationStateStream.value;
  set authState(AuthState value) => _authenticationStateStream.value = value;

  String? token;
  int? userId;

  bool _showLoginView = true;

  @override
  void onInit() {
    super.onInit();
    initUser();
  }

  Future<bool> signIn(String email, String password,
      {String cul = "tr", String guidstr = ""}) async {
    try {
      var user = await service.login(
          email: email, password: password, culture: cul, guidstr: guidstr);

      _transitionToHome();
      _authenticationStateStream.value = Authenticated(user: user);
      this.user.value = user;
      token = user?.token; // Save the token

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> resetPassword(String oldPassword, String newPassword) async {
    try {
      bool success = await service.resetPassword(oldPassword, newPassword);
      return success;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<void> updateUserProfile(User updatedUser) async {
    try {
      await service.updateUserProfile(updatedUser);
      final currentUser = user.value;
      currentUser?.title = updatedUser.title;
      currentUser?.name = updatedUser.name;
      currentUser?.surname = updatedUser.surname;
      currentUser?.email = updatedUser.email;
      user.value = currentUser;
      user.update((user) {
        user?.pictureurl = updatedUser.pictureurl;
      });
    } catch (error) {
      print('Failed to update user profile: $error');
      // Handle the error and display an error message to the user
    }
  }

  Future<void> signOut([bool clearToken = false]) async {
    _showLoginView = true;
    _transitionToLoginView();

    _authenticationStateStream.value = AuthState(); // Set default AuthState
    this.user.value = null;
    if (clearToken) {
      // Clear the token logic here
      Isar? isar = await Isar.getInstance();
      User? user;
      final dir = await getApplicationDocumentsDirectory();

      isar ??= await Isar.open([UserSchema], directory: dir.path);

      user = await isar.users.filter().tokenIsNotEmpty().findFirst();
      if (user != null) {
        user.token = '';
        await isar.writeTxn(() async {
          await isar?.users.put(user!);
        });
      }
    }
  }

  Future<void> initUser() async {
    Isar? isar = await Isar.getInstance();
    final dir = await getApplicationDocumentsDirectory();

    isar ??= Isar.getInstance() ??
        await Isar.open([UserSchema], directory: dir.path);
    var currentUser = await service.getCurrentUser();

    if (currentUser != null) {
      _authenticationStateStream.value = Authenticated(user: currentUser);
      this.user.value = currentUser;
      _transitionToHome();
    } else {
      _authenticationStateStream.value = AuthState(); // Set default AuthState
      this.user.value = null;
      _transitionToLoginView();
    }
  }

  void _transitionToHome() {
    if (_showLoginView) {
      _showLoginView = false;

      if (!_showLoginView) {
        _showLoginView = true;
        update();
      }

      update();
    }
  }

  void _transitionToLoginView() {
    if (!_showLoginView) {
      _showLoginView = true;

      if (_showLoginView) {
        _showLoginView = false;
        update();
      }

      update();
    }
  }
}
