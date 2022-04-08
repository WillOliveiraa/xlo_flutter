import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

class SignUpUserModel extends SignUpUserEntity {
  SignUpUserModel({
    required String name,
    required String email,
    required String password,
    required String passwordConf,
    required String phone,
    UserType type = UserType.PARTICULAR,
    dynamic image,
  }) : super(
          name: name,
          email: email,
          password: password,
          passwordConf: passwordConf,
          phone: phone,
          type: type,
          image: image,
        );

  factory SignUpUserModel.signUpUser({
    required String name,
    required String email,
    required String password,
    required String passwordConf,
    required String phone,
    UserType type = UserType.PARTICULAR,
    dynamic image,
  }) {
    return SignUpUserModel(
      name: name,
      email: email,
      password: password,
      passwordConf: passwordConf,
      phone: phone,
      type: type,
      image: image,
    );
  }

  @override
  String toString() {
    return 'SignUpUserModel(name: $name, email: $email, phone: $phone, password: $password, type: $type)';
  }
}
