import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  String? get message;
}
