import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/core/pages/base/base_controller.dart';

import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/logout_user_usecase.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  _AuthControllerBase(this._getCurrentUserUsecase, this._logoutUserUsecase,
      this._baseController);

  final GetCurrentUserImp _getCurrentUserUsecase;
  final LogoutUserUseCaseImp _logoutUserUsecase;
  final BaseController _baseController;

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
    final result = await _getCurrentUserUsecase();

    loading = false;
    return result.fold((l) => false, (user) {
      setUser(user as UserModel);
      return true;
    });
  }

  Future<void> logout() async {
    loading = true;
    final result = await _logoutUserUsecase();
    loading = false;

    result.fold((l) => false, (_) {
      setUser(null);
      _baseController.setPage(0);
    });
  }
}
