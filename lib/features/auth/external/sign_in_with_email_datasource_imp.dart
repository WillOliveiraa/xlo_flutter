import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/errors/parse_errors.dart';
import 'package:xlo_flutter/features/auth/data/datasources/sign_in_with_email_datasource.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_sign_in_with_email.dart';

class SignInWithEmailDatasourceImp implements SignInWithEmailDatasource {
  @override
  Future<Either<Failure, UserModel>> signInWithEmail(
      {required String email, required String password}) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return Right(UserModel.fromParse(parseUser));
    } else {
      return Left(ErrorSignInWithEmail(
          message: ParseErrors.getDescription(response.error!.code)));
    }
  }
}
