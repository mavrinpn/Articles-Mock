class AuthenticationException implements Exception {
  final String errorCode;

  const AuthenticationException([
    this.errorCode = 'unknown_exception',
  ]);

  factory AuthenticationException.fromCode(String code) {
    return AuthenticationException(code);
  }
}

class LocalDataException implements Exception {
  final String errorCode;

  const LocalDataException([
    this.errorCode = 'unknown_exception',
  ]);

  factory LocalDataException.fromCode(String code) {
    return LocalDataException(code);
  }
}
