import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorGetCurrentUser extends Failure {
  @override
  String? get message => 'Ocorreu um erro ao tentar obter os anúncios';

  @override
  List<Object?> get props => throw UnimplementedError();
}
