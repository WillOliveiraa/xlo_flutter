import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetCurrentUser extends Failure {
  ErrorGetCurrentUser({this.message});

  @override
  final String? message;
}
