import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetMyFavoriteAds extends Failure {
  ErrorGetMyFavoriteAds({this.message});

  @override
  final String? message;
}
