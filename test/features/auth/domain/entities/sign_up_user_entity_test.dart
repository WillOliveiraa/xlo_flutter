import 'package:flutter_test/flutter_test.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';

void main() {
  group('should check if fields is valid or not', () {
    test('password conf', () {
      expect(
          SignUpUserEntity(
                  name: 'Will Teste',
                  email: 'email',
                  password: '123123',
                  passwordConf: '123555',
                  phone: '222222222')
              .isValidPasswordsAreTheSame,
          false);
      expect(
          SignUpUserEntity(
                  name: 'Will Teste',
                  email: 'email',
                  password: '123123',
                  passwordConf: '123123',
                  phone: '222222222')
              .isValidPasswordsAreTheSame,
          true);
    });
  });
}
