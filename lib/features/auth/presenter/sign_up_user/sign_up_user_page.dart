import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xlo_flutter/core/shared/widgets/button_default.dart';
import 'package:xlo_flutter/core/shared/widgets/circular_progress_ind_default.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/sign_up_user_controller.dart';

import 'components/field_title.dart';

class SignUpUserPage extends StatefulWidget {
  const SignUpUserPage(this.user, {Key? key}) : super(key: key);

  final UserModel? user;

  @override
  State<SignUpUserPage> createState() => _SignUpUserPageState();
}

class _SignUpUserPageState
    extends ModularState<SignUpUserPage, SignUpUserController> {
  @override
  void initState() {
    super.initState();
    if (widget.user != null) controller.initializeFields(widget.user!);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final color = Theme.of(context).accentColor;
    final user = widget.user;
    return Scaffold(
      appBar: AppBar(title: Text(user != null ? 'Alterar' : 'Cadastrar')),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: user == null,
                      child: Text(
                        'Acessar com e-mail',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                      ),
                    ),
                    Observer(builder: (_) {
                      return Column(
                        children: [
                          const SizedBox(height: 16),
                          IgnorePointer(
                            ignoring: controller.loading,
                            child: LayoutBuilder(
                              builder: (_, constraints) {
                                return ToggleSwitch(
                                  minWidth: constraints.biggest.width / 2.25,
                                  labels: ['Particular', 'Profissional'],
                                  totalSwitches: 2,
                                  cornerRadius: 20,
                                  activeBgColor: [
                                    Theme.of(context).primaryColor
                                  ],
                                  inactiveBgColor: Colors.grey,
                                  activeFgColor: Colors.white,
                                  inactiveFgColor: Colors.white,
                                  initialLabelIndex: controller.userType.index,
                                  onToggle: controller.setUserType,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const FieldTitle(
                            title: 'Apelido',
                            subtitle: 'Como aparecerá em seus anúncios.',
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: !controller.loading,
                              initialValue: user != null ? user.name : '',
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: João S.',
                                  errorText: controller.nameError),
                              onChanged: controller.setName,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'E-mail',
                            subtitle: 'Enviaremos um e-mail de confirmação.',
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: !controller.loading && user == null,
                              initialValue: user != null ? user.email : '',
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: joao@gmail.com',
                                  errorText: controller.emailError),
                              onChanged: controller.setEmail,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'Celular',
                            subtitle: 'Proteja sua conta.',
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: !controller.loading,
                              initialValue: user != null ? user.phone : '',
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: (99) 99999-9999',
                                  errorText: controller.phoneError),
                              keyboardType: TextInputType.phone,
                              onChanged: controller.setPhone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()
                              ],
                            );
                          }),
                          const SizedBox(height: 16),
                          FieldTitle(
                            title: user != null ? 'Nova Senha' : 'Senha',
                            subtitle:
                                'Use letras, números e caracteres especiais.',
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: !controller.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: controller.passwordError),
                              obscureText: true,
                              onChanged: controller.setPassword,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'Confirmar Senha',
                            subtitle: 'Repita a Senha',
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: !controller.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: controller.passwordErrorConf),
                              obscureText: true,
                              onChanged: controller.setPasswordConf,
                            );
                          }),
                          const SizedBox(height: 16),
                          Observer(builder: (_) {
                            return SizedBox(
                              height: 44,
                              child: ButtonDefault(
                                onPressed: user != null
                                    ? controller.savePressed as Function()?
                                    : controller.signUpPressed as Function()?,
                                child: controller.loading
                                    ? const CircularProgressIndDefault(
                                        color: Colors.white)
                                    : const Text('Salvar',
                                        style: TextStyle(fontSize: 18.0)),
                              ),
                            );
                          }),
                          Visibility(
                            visible: user == null,
                            child: Column(
                              children: [
                                const Divider(color: Colors.black26),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      const Text('Já tem uma conta? ',
                                          style: TextStyle(fontSize: 16)),
                                      GestureDetector(
                                        onTap: Navigator.of(context).pop,
                                        child: Text(
                                          'Entrar',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: color,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
