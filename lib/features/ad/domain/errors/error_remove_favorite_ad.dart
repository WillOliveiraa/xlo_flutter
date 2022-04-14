import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorRemoveFavoriteAd extends Failure {
  final String? message;

  ErrorRemoveFavoriteAd({this.message});
}
