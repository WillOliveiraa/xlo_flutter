import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorUpdateAdStatus extends Failure {
  final String? message;

  ErrorUpdateAdStatus({this.message});
}
