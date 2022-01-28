import 'package:flutter_test/flutter_test.dart';
import 'package:xlo_flutter/features/login/domain/entities/user_entity.dart';

void main() {
  group('should check if fields is valid or not', () {
    test('name, email, password', () {
      // name
      expect(
          UserEntity(name: '', email: 'email', password: 'password')
              .isValidName,
          false);
      expect(
          UserEntity(name: 'Will', email: 'email', password: 'password')
              .isValidName,
          true);
      // email
      expect(
          UserEntity(name: 'Will', email: '', password: 'password')
              .isValidEmail,
          false);
      expect(
          UserEntity(name: 'Will', email: 'will@teste', password: 'password')
              .isValidEmail,
          false);
      expect(
          UserEntity(
                  name: 'Will', email: 'will@teste.com', password: 'password')
              .isValidEmail,
          true);
      // password
      expect(
          UserEntity(name: 'Will', email: 'will@teste.com', password: '')
              .isValidPassword,
          false);
      expect(
          UserEntity(name: 'Will', email: 'will@teste.com', password: 'pass')
              .isValidPassword,
          false);
      expect(
          UserEntity(
                  name: 'Will', email: 'will@teste.com', password: 'password')
              .isValidPassword,
          true);
    });
  });
}
