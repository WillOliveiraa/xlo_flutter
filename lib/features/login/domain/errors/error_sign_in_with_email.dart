import 'package:xlo_flutter/core/errors/failure.dart';

class ErrorSignInWithEmail extends Failure {
  @override
  String? get message => 'Erro ao tentar salvar o usuário';

  @override
  List<Object?> get props => [message];
}
