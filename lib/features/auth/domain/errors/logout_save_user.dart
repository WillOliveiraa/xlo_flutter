import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorLogoutUser extends Failure {
  final String? message;

  ErrorLogoutUser({this.message});
}
