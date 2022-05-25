import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/logout_user_datasource.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_save_user.dart';

class LogoutUserDatasourceImp implements LogoutUserDatasource {
  @override
  Future<Either<Failure, Unit>> logoutUser() async {
    try {
      final parseUser = await ParseUser.currentUser() as ParseUser;

      await parseUser.logout();

      return const Right(unit);
    } catch (e) {
      return Left(ErrorSaveUser(message: 'Erro ao tentar sair'));
    }
  }
}
