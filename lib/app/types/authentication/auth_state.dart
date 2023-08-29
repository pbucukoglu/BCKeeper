import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../data/models/User.dart';

class AuthState {
  const AuthState();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user}) {
    Isar? isar = Isar.getInstance();
    getApplicationDocumentsDirectory().then((dir) {
      isar ??= Isar.openSync([UserSchema], directory: dir.path);
      isar?.users.deleteAll(isar?.users
              .filter()
              .tokenIsNotEmpty()
              .findAllSync()
              .map((e) => e.dbId)
              .toList() ??
          []);
      isar?.writeTxnSync(() => isar?.users.putSync(user));
    });
  }

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}
