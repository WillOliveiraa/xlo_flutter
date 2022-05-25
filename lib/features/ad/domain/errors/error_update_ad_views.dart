import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorUpdateAdViews extends Failure {
  ErrorUpdateAdViews({this.message});

  @override
  final String? message;
}
