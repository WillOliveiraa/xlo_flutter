import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetAllCities extends Failure {
  ErrorGetAllCities({this.message});

  @override
  final String? message;
}
