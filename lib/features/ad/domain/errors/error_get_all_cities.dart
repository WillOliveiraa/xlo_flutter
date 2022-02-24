import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetAllCities extends Failure {
  final String? message;

  ErrorGetAllCities({this.message});
}
