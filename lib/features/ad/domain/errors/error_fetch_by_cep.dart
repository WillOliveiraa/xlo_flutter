import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorFetchByCep extends Failure {
  ErrorFetchByCep({this.message});

  @override
  final String? message;
}
