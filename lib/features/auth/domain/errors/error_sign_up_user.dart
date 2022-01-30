import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSignUpUser extends Failure {
  final String? message;

  ErrorSignUpUser({this.message});

  @override
  List<Object?> get props => [message];
}
