import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorFetchByCep extends Failure {
  final String? message;

  ErrorFetchByCep({this.message});
}
