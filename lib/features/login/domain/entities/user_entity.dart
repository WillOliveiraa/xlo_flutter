import 'package:string_validator/string_validator.dart' as validator;

enum UserType { PARTICULAR, PROFESSIONAL }

class UserEntity {
  final String name;
  final String email;
  final String? phone;
  final String password;
  final UserType type;

  UserEntity({
    required this.name,
    required this.email,
    this.phone,
    required this.password,
    this.type = UserType.PARTICULAR,
  });

  bool get isValidName => name.isNotEmpty;

  bool get isValidEmail => validator.isEmail(email);

  bool get isValidPassword => password.isNotEmpty && password.length > 4;
}
