import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/login/domain/entities/user_entity.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/login/domain/errors/error_get_current_user.dart';
import 'package:xlo_flutter/features/login/domain/repositories/get_current_user_repository.dart';

class GetCurrentUserDatasourceMock extends Mock
    implements GetCurrentUserDatasource {}

class GetCurrentUserRepositoryImp implements GetCurrentUserRepository {
  final GetCurrentUserDatasource _datasource;

  GetCurrentUserRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      return await _datasource.getCurrentUser();
    } catch (e) {
      return Left(ErrorGetCurrentUser());
    }
  }
}

abstract class GetCurrentUserDatasource {
  Future<Either<Failure, UserModel>> getCurrentUser();
}

void main() {
  final datasource = GetCurrentUserDatasourceMock();
  final repository = GetCurrentUserRepositoryImp(datasource);
  final userModel = UserModel(
    id: 'jklj231s',
    name: 'Will Oliveira',
    email: 'will@teste.com',
    password: '123123',
  );

  test('should get current user', () async {
    when(() => datasource.getCurrentUser())
        .thenAnswer((_) async => Right(userModel));

    final result = await repository.getCurrentUser();

    expect(result, isA<Right<Failure, UserModel>>());
    verify(() => datasource.getCurrentUser()).called(1);
  });

  test('should return a ErrorGetCurrentUser', () async {
    when(() => datasource.getCurrentUser()).thenThrow(ErrorGetCurrentUser());

    final result = (await repository.getCurrentUser()).fold(id, id);

    expect(result, isA<ErrorGetCurrentUser>());
    verify(() => datasource.getCurrentUser()).called(1);
  });
}

class UserModel extends UserEntity {
  final String? id;

  UserModel({
    this.id,
    required String name,
    required String email,
    required String password,
    String? phone,
    UserType type = UserType.PARTICULAR,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          type: type,
        );
}