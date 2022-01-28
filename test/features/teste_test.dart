import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/login/domain/entities/user_entity.dart';

// class SaveUserRepositoryMock extends Mock implements SaveUserRepository {}

abstract class GetUserInfo {
  Future<Either<Failure, UserEntity>> call();
}

void main() {
  test('should save user', () async {
    // final result = (await usecase()).fold(id, id);
  });

  test('should return a ErrorSaveUser', () async {});
}
