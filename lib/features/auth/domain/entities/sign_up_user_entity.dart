import 'package:string_validator/string_validator.dart' as validator;

import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

class SignUpUserEntity extends UserEntity {
  SignUpUserEntity({
    required String name,
    required String email,
    required String? password,
    required this.passwordConf,
    required String phone,
    UserType type = UserType.particular,
    dynamic image,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          type: type,
          image: image,
        );

  String? passwordConf;

  bool get isValidPhone => phone != null && phone!.length >= 14;

  bool get isValidPasswordsAreTheSame =>
      validator.equals(password!, passwordConf);
}
