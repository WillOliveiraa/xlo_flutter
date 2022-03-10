import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_save_user.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/save_user_repository.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/save_user_usecase.dart';

class SaveUserRepositoryMock extends Mock implements SaveUserRepository {}

void main() {
  final repository = SaveUserRepositoryMock();
  final usecase = SaveUserUseCaseImp(repository);
  final userEntity = SignUpUserEntity(
      name: 'Will Oliveira',
      email: 'will@teste.com',
      password: null,
      passwordConf: null,
      type: UserType.PARTICULAR,
      phone: '123123123123123');

  test('should save user', () async {
    when(() => repository.saveUser(userEntity))
        .thenAnswer((_) async => Right(unit));

    final result = (await usecase(userEntity)).fold(id, id);

    expect(result, unit);
    verify(() => repository.saveUser(userEntity)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a ErrorSaveUser', () async {
    when(() => repository.saveUser(userEntity))
        .thenAnswer((_) async => Left(ErrorSaveUser()));

    final result = (await usecase(userEntity)).fold(id, id);

    expect(result, isA<ErrorSaveUser>());
    verify(() => repository.saveUser(userEntity)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
