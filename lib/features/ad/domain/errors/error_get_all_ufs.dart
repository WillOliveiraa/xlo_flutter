import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetAllUfs extends Failure {
  ErrorGetAllUfs({this.message});

  @override
  final String? message;
}
