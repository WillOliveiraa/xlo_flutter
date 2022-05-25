import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSignInWithEmail extends Failure {
  ErrorSignInWithEmail({this.message});

  @override
  final String? message;
}
