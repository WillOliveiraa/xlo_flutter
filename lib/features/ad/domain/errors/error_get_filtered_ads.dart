import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetFilteredAds extends Failure {
  ErrorGetFilteredAds({this.message});

  @override
  final String? message;
}
