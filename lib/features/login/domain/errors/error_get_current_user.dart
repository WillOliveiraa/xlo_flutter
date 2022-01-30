import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetCurrentUser extends Failure {
  final String? message;

  ErrorGetCurrentUser({this.message});

  @override
  List<Object?> get props => [message];
}
