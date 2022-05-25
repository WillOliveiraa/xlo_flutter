import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetMyAds extends Failure {
  ErrorGetMyAds({this.message});

  @override
  final String? message;
}
