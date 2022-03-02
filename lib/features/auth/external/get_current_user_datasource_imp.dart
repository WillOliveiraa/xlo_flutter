import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/parse_errors.dart';
import 'package:xlo_flutter/features/auth/data/datasources/get_current_user_datasource.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_get_current_user.dart';

class GetCurrentUserDatasourceImp implements GetCurrentUserDatasource {
  @override
  Future<Either<Failure, UserModel>> getCurrentUser() async {
    final parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      final response = await ParseUser.getCurrentUserFromServer(
          parseUser.sessionToken as String);

      if (response!.success)
        return Right(UserModel.fromParse(parseUser));
      else {
        parseUser.logout();
        return Left(ErrorGetCurrentUser(
            message: ParseErrors.getDescription(response.error!.code)));
      }
    }
    return Left(ErrorGetCurrentUser(message: ParseErrors.getDescription(209)));
  }
}
