import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetFilteredAds extends Failure {
  final String? message;

  ErrorGetFilteredAds({this.message});
}
