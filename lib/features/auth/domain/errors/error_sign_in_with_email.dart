import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSignInWithEmail extends Failure {
  final String? message;

  ErrorSignInWithEmail({this.message});
}
