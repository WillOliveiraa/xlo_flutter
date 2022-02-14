import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetAllCategories extends Failure {
  final String? message;

  ErrorGetAllCategories({this.message});

  @override
  List<Object?> get props => [message];
}
