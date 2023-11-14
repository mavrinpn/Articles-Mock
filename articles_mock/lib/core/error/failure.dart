import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocalDataServiceFailure extends Failure {
  final String errorCode;

  LocalDataServiceFailure(this.errorCode);

  @override
  List<Object?> get props => [errorCode];
}

class AuthenticationFailure extends Failure {
  final String errorCode;

  AuthenticationFailure(this.errorCode);

  @override
  List<Object?> get props => [errorCode];
}
