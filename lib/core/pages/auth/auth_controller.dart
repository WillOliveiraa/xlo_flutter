import 'package:mobx/mobx.dart';

import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/get_current_user_usecase.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final GetCurrentUserImp _getCurrentUserUsecase;

  _AuthControllerBase(this._getCurrentUserUsecase);

  @observable
  UserModel? _userModel;

  @observable
  bool loading = false;

  @computed
  bool get isLoggedIn => user != null;

  UserModel? get user => _userModel;

  @action
  void setUser(UserModel? user) => _userModel = user;

  Future<bool> checkLogin() async {
    loading = true;
    var result = await _getCurrentUserUsecase();

    loading = false;
    return result.fold((l) => false, (user) {
      setUser(user as UserModel);
      return true;
    });
  }
}
