import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSignUpUser extends Failure {
  ErrorSignUpUser({this.message});

  @override
  final String? message;
}
