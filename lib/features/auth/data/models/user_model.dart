import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:xlo_flutter/features/ad/data/utils/table_keys.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? id;
  final DateTime? createdAt;

  UserModel({
    this.id,
    required String name,
    required String email,
    String? password,
    String? phone,
    UserType type = UserType.PARTICULAR,
    this.createdAt,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          type: type,
        );

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

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, password: $password, type: $type)';
  }
}
