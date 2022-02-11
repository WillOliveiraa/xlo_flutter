import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

abstract class AdState {}

class InitialAdState extends AdState {}

class SuccessAdState extends AdState {
  final List<AdModel> adsList;

  SuccessAdState(this.adsList);
}

class LoadingAdState extends AdState {}

class ErrorAdState extends AdState {
  final String message;

  ErrorAdState(this.message);
}
