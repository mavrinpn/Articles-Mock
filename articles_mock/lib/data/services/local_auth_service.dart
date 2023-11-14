import 'package:articles_mock/core/error/exception.dart';

class LocalAuthService {
  Map<String, String> emailToPasswordMap = {};
  String currentUserEmail = '';

  String getCurrentUserEmail() {
    return currentUserEmail;
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (emailToPasswordMap.containsKey(email)) {
      throw const AuthenticationException('email-already-in-use');
    }
    emailToPasswordMap[email] = password;
    currentUserEmail = email;

    return Future.value();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (!emailToPasswordMap.containsKey(email)) {
      throw const AuthenticationException('user-not-found');
    }
    if (emailToPasswordMap[email] != password) {
      throw const AuthenticationException('wrong-password');
    }
    currentUserEmail = email;

    return Future.value();
  }

  Future<void> signOut() async {
    currentUserEmail = '';
    return Future.value();
  }
}
