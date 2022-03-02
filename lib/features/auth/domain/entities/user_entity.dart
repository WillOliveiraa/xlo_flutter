import 'package:string_validator/string_validator.dart' as validator;

enum UserType { PARTICULAR, PROFESSIONAL }

class UserEntity {
  final String? id;
  final String name;
  final String email;
  final String? phone;
  final String? password;
  final UserType type;
  final DateTime? createdAt;

  UserEntity({
    this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.password,
    this.type = UserType.PARTICULAR,
    this.createdAt,
  });

  bool get isValidName => name.isNotEmpty;

  bool get isValidEmail => validator.isEmail(email);

  bool get isValidPassword => password != null && password!.length > 4;
}
