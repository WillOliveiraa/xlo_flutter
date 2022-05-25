import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';

import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String email,
    String? password,
    String? phone,
    UserType type = UserType.PARTICULAR,
    final DateTime? createdAt,
    String? id,
    dynamic image,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          type: type,
          id: id,
          createdAt: createdAt,
          image: image,
        );

  factory UserModel.signInWithEmail({
    String? name,
    required String email,
    required String password,
  }) {
    return UserModel(
      name: name!,
      email: email,
      password: password,
    );
  }

  factory UserModel.fromParse(ParseUser parseUser) {
    return UserModel(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName) as String,
      email: parseUser.get(keyUserEmail) as String,
      phone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType) as int],
      createdAt: parseUser.get(keyUserCreatedAt),
      image: parseUser.get(keyUserImage) != null
          ? parseUser.get(keyUserImage).url
          : null,
    );
  }

  factory UserModel.fromParseAd(ParseUser parseUser) {
    return UserModel(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName) as String,
      email: '',
      phone: parseUser.get(keyUserPhone),
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, password: $password, type: $type, createdAt: $createdAt)';
  }
}
