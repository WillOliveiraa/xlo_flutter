import 'package:xlo_flutter/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? id;

  UserModel({
    this.id,
    required String name,
    required String email,
    required String password,
    String? phone,
    UserType type = UserType.PARTICULAR,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          type: type,
        );
}
