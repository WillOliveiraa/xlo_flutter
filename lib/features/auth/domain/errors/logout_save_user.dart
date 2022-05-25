import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorLogoutUser extends Failure {
  ErrorLogoutUser({this.message});

  @override
  final String? message;
}
