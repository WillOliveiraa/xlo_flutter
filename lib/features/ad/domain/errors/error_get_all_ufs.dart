import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetAllUfs extends Failure {
  final String? message;

  ErrorGetAllUfs({this.message});
}
