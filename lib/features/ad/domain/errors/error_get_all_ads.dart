import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetAllAds extends Failure {
  ErrorGetAllAds({this.message});

  @override
  final String? message;
}
