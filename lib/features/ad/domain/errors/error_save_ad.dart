import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSaveAd extends Failure {
  ErrorSaveAd({this.message});

  @override
  final String? message;
}
