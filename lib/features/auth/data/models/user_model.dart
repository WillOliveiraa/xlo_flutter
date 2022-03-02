import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';

import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final DateTime? createdAt;

  UserModel({
    required String name,
    required String email,
    String? password,
    String? phone,
    UserType type = UserType.PARTICULAR,
    this.createdAt,
    String? id,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          type: type,
          id: id,
        );

  factory UserModel.signInWithEmail({
    String? name,
    required String email,
    required String password,
    String? passwordConf,
    String? phone,
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
      name: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }

  factory UserModel.fromParseAd(ParseUser parseUser) {
    return UserModel(id: parseUser.objectId, name: '', email: '');
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, password: $password, type: $type)';
  }
}
