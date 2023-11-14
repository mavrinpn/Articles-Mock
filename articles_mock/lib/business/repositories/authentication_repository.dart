import 'package:articles_mock/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  String getCurrentUserEmail();
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signIn({
    required String email,
    required String password,
  });
  Future<void> signOut();
}
