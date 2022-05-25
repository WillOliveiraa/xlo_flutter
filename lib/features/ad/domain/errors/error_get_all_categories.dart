import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetAllCategories extends Failure {
  ErrorGetAllCategories({this.message});

  @override
  final String? message;
}
