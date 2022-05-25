import 'package:string_validator/string_validator.dart' as validator;

enum UserType { particular, professional }

class UserEntity {
  UserEntity({
    this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.password,
    this.type = UserType.particular,
    this.createdAt,
    this.image,
  });

  final String? id;
  final String name;
  final String email;
  final String? phone;
  final String? password;
  final UserType type;
  final DateTime? createdAt;
  final dynamic image;

  bool get isValidName => name.isNotEmpty;

  bool get isValidEmail => validator.isEmail(email);

  bool get isValidPassword => password != null && password!.length > 4;
}
