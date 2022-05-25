import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSaveFavoriteAd extends Failure {
  ErrorSaveFavoriteAd({this.message});

  @override
  final String? message;
}
