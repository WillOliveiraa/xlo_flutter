import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetMyFavoriteAds extends Failure {
  final String? message;

  ErrorGetMyFavoriteAds({this.message});
}
