import 'package:articles_mock/business/repositories/authentication_repository.dart';
import 'package:articles_mock/core/error/exception.dart';
import 'package:articles_mock/core/error/failure.dart';
import 'package:articles_mock/data/services/local_auth_service.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final LocalAuthService localAuthService;

  AuthenticationRepositoryImp({required this.localAuthService});

  @override
  String getCurrentUserEmail() {
    return localAuthService.getCurrentUserEmail();
  }

  @override
  Future<Either<Failure, void>> signIn(
      {required String email, required String password}) async {
    try {
      await localAuthService.signIn(
        email: email,
        password: password,
      );
      return const Right(null);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(e.errorCode));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(
      {required String email, required String password}) async {
    try {
      await localAuthService.signUp(
        email: email,
        password: password,
      );
      return const Right(null);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(e.errorCode));
    }
  }

  @override
  Future<void> signOut() {
    return localAuthService.signOut();
  }
}
