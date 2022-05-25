import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorRemoveFavoriteAd extends Failure {
  ErrorRemoveFavoriteAd({this.message});

  @override
  final String? message;
}
