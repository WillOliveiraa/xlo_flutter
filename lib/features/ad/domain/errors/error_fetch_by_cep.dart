import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorFetchByCep extends Failure {
  @override
  String? get message => 'Ocorreu um erro ao tentar buscar o cep';
}
