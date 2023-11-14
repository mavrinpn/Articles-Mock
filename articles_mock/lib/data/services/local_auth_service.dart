import 'package:articles_mock/core/error/exception.dart';

class LocalAuthService {
  String getCurrentUserEmail() {
    return '';
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      return;
    } catch (_) {
      throw const AuthenticationException();
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return;
    } catch (_) {
      throw const AuthenticationException();
    }
  }

  Future<void> signOut() async {
    return;
  }
}
