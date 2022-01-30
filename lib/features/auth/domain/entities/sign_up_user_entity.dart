import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

class SignUpUserEntity extends UserEntity {
  SignUpUserEntity({
    required String name,
    required String email,
    required String password,
    required String phone,
    UserType type = UserType.PARTICULAR,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          type: type,
        );

  bool get phoneValid => phone != null && phone!.length >= 14;
}
