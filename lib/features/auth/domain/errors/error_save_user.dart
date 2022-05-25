import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSaveUser extends Failure {
  ErrorSaveUser({this.message});

  @override
  final String? message;
}
