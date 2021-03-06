import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/errors/parse_errors.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/auth/data/datasources/save_user_datasource.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_save_user.dart';
import 'package:xlo_flutter/features/auth/external/save_image_user.dart';

class SaveUserDatasourceImp implements SaveUserDatasource {
  @override
  Future<Either<Failure, Unit>> saveUser(SignUpUserEntity user) async {
    final parseUser = await ParseUser.currentUser() as ParseUser;

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone!);
    parseUser.set<int>(keyUserType, user.type.index);

    final parseImage = await SaveImageUser.saveImage(user.image);

    parseUser.set<ParseFile>(keyUserImage, parseImage);

    if (user.password != null && user.password!.isNotEmpty) {
      parseUser.password = user.password;
    }

    final response = await parseUser.save();

    if (response.success) {
      return const Right(unit);
    } else {
      return Left(ErrorSaveUser(
          message: ParseErrors.getDescription(response.error!.code)));
    }
  }
}
