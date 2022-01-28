import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/login/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/login/domain/errors/error_get_current_user.dart';
import 'package:xlo_flutter/features/login/domain/repositories/get_current_user_repository.dart';
import 'package:xlo_flutter/features/login/domain/usecases/get_current_user_usecase.dart';

class GetCurrentUserRepositoryMock extends Mock
    implements GetCurrentUserRepository {}

void main() {
  final repository = GetCurrentUserRepositoryMock();
  final usecase = GetCurrentUserImp(repository);
  final userEntity = UserEntity(
    name: 'Will Oliveira',
    email: 'will@teste.com',
    password: '123123',
  );

  test('should get current user', () async {
    when(() => repository.getCurrentUser())
        .thenAnswer((_) async => Right(userEntity));

    final result = (await usecase()).fold(id, id);

    expect(result, isA<UserEntity>());
    verify(() => repository.getCurrentUser()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a ErrorSaveUser', () async {
    when(() => repository.getCurrentUser())
        .thenAnswer((_) async => Left(ErrorGetCurrentUser()));

    final result = (await usecase()).fold(id, id);

    expect(result, isA<ErrorGetCurrentUser>());
    verify(() => repository.getCurrentUser()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
