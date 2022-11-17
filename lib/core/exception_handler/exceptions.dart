class BadRequestException implements Exception {
  final String message;

  BadRequestException({required this.message});
}

class UnAuthorizedtException implements Exception {
  final String message;

  UnAuthorizedtException({required this.message});
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException({required this.message});
}

class RateLimitExceededException implements Exception {
  final String message;

  RateLimitExceededException({required this.message});
}

class InternalServerException implements Exception {
  final String message;

  InternalServerException({required this.message});
}

class SomethingWentWrongException implements Exception {
  final String message;

  SomethingWentWrongException({required this.message});
}
