import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSaveAd extends Failure {
  final String? message;

  ErrorSaveAd({this.message});
}
