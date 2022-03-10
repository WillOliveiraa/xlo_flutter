import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSaveUser extends Failure {
  final String? message;

  ErrorSaveUser({this.message});
}
