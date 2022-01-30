import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/sign_in_with_email_datasource.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/data/repositories/sign_in_with_email_repository_imp.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_sign_in_with_email.dart';

class SignInWithEmailDatasourceMock extends Mock
    implements SignInWithEmailDatasource {}

void main() {
  final datasource = SignInWithEmailDatasourceMock();
  final repository = SignInWithEmailRepositoryImp(datasource);
  final user = UserModel(
    id: 'jklj231s',
    name: 'Will Oliveira',
    email: 'will@teste.com',
    password: '123123',
  );

  test('should sign in with email', () async {
    when(() => datasource.signInWithEmail(
        email: user.email,
        password: user.password!)).thenAnswer((_) async => Right(user));

    final result = await repository.signInWithEmail(
        email: user.email, password: user.password!);

    expect(result, isA<Right<Failure, UserModel>>());
    verify(() => datasource.signInWithEmail(
        email: user.email, password: user.password!)).called(1);
  });

  test('should return a ErrorSignInWithEmail', () async {
    when(() => datasource.signInWithEmail(
        email: user.email,
        password: user.password!)).thenThrow(ErrorSignInWithEmail());

    final result = (await repository.signInWithEmail(
            email: user.email, password: user.password!))
        .fold(id, id);

    expect(result, isA<ErrorSignInWithEmail>());
    verify(() => datasource.signInWithEmail(
        email: user.email, password: user.password!)).called(1);
  });
}
