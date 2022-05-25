import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorUpdateAdStatus extends Failure {
  ErrorUpdateAdStatus({this.message});

  @override
  final String? message;
}
