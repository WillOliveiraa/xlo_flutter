import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/parse_errors.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/auth/data/datasources/sign_up_user_datasource.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_sign_up_user.dart';

class SignUpUserDatasourceImp implements SignUpUserDatasource {
  @override
  Future<Either<Failure, UserModel>> signUpUser(
      SignUpUserEntity signUpUserEntity) async {
    final parseUser = ParseUser(
      signUpUserEntity.email,
      signUpUserEntity.password,
      signUpUserEntity.email,
    );

    parseUser.set<String>(keyUserName, signUpUserEntity.name);
    parseUser.set<String>(keyUserPhone, signUpUserEntity.phone!);
    parseUser.set<int>(keyUserType, signUpUserEntity.type.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return Right(UserModel.fromParse(parseUser));
    } else {
      return Left(ErrorSignUpUser(
          message: ParseErrors.getDescription(response.error!.code)));
    }
  }
}
