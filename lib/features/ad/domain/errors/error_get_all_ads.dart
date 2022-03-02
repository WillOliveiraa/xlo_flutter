import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetAllAds extends Failure {
  final String? message;

  ErrorGetAllAds({this.message});
}
