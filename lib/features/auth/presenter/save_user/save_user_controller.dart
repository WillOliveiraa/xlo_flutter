import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

part 'save_user_controller.g.dart';

class SaveUserController = _SaveUserControllerBase with _$SaveUserController;

abstract class _SaveUserControllerBase with Store {
  @observable
  UserType? _userType;

  UserType get userType => _userType!;

  @action
  void setUserType(int value) => _userType = UserType.values[value];

  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  // @computed
  // String get nameError =>
  //     nameValid || name == null ? null : 'Campo obrigatório';

  // @observable
  // String phone;

  // @action
  // void setPhone(String value) => phone = value;

  // @computed
  // bool get phoneValid => phone != null && phone.length >= 14;
  // String get phoneError =>
  //     phoneValid || phone == null ? null : 'Campo obrigatório';

  // @observable
  // String pass1 = '';

  // @action
  // void setPass1(String value) => pass1 = value;

  // @observable
  // String pass2 = '';

  // @action
  // void setPass2(String value) => pass2 = value;

  // @computed
  // bool get passValid => pass1 == pass2 && (pass1.length >= 6 || pass1.isEmpty);
  // String get passError {
  //   if (pass1.isNotEmpty && pass1.length < 6)
  //     return 'Senha muito curta';
  //   else if (pass1 != pass2) return 'Senhas não coincidem';
  //   return null;
  // }

  // @computed
  // bool get isFormValid => nameValid && phoneValid && passValid;

  // @observable
  // bool loading = false;

  // @computed
  // VoidCallback get savePressed => (isFormValid && !loading) ? _save : null;

  // @action
  // Future<void> _save() async {
  //   loading = true;

  //   user.name = name;
  //   user.phone = phone;
  //   user.type = userType;

  //   if (pass1.isNotEmpty)
  //     user.password = pass1;
  //   else
  //     user.password = null;

  //   try {
  //     await UserRepository().save(user);
  //     userManagerStore.setUser(user);
  //   } catch (e) {
  //     print(e);
  //   }

  //   loading = false;
  // }
}
