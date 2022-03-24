import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetMyAds extends Failure {
  final String? message;

  ErrorGetMyAds({this.message});
}
