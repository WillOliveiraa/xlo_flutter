import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/login/data/datasources/sign_in_with_email_datasource.dart';
import 'package:xlo_flutter/features/login/data/repositories/sign_in_with_email_repository_imp.dart';
import 'package:xlo_flutter/features/login/domain/errors/error_sign_in_with_email.dart';

class SignInWithEmailDatasourceMock extends Mock
    implements SignInWithEmailDatasource {}

void main() {
  final datasource = SignInWithEmailDatasourceMock();
  final repository = SignInWithEmailRepositoryImp(datasource);
  String email = 'will@teste.com';
  String password = '123123';

  test('should sign in with email', () async {
    when(() => datasource.signInWithEmail(email: email, password: password))
        .thenAnswer((_) async => Right(unit));

    final result =
        await repository.signInWithEmail(email: email, password: password);

    expect(result, isA<Right<Failure, Unit>>());
    verify(() => datasource.signInWithEmail(email: email, password: password))
        .called(1);
  });

  test('should return a ErrorSignInWithEmail', () async {
    when(() => datasource.signInWithEmail(email: email, password: password))
        .thenThrow(ErrorSignInWithEmail());

    final result =
        (await repository.signInWithEmail(email: email, password: password))
            .fold(id, id);

    expect(result, isA<ErrorSignInWithEmail>());
    verify(() => datasource.signInWithEmail(email: email, password: password))
        .called(1);
  });
}
