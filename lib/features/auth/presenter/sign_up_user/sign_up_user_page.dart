import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/sign_up_user_controller.dart';

import 'components/field_title.dart';

class SignUpUserPage extends StatelessWidget {
  const SignUpUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final color = Theme.of(context).accentColor;
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar')),
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
                    Text(
                      'Acessar com e-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                    ),
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
                          Consumer<SignUpUserController>(
                              builder: (_, signUpController, child) {
                            return TextFormField(
                              enabled: !signUpController.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: João S.',
                                  errorText: signUpController.nameError),
                              onChanged: signUpController.setName,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'E-mail',
                            subtitle: 'Enviaremos um e-mail de confirmação.',
                          ),
                          Consumer<SignUpUserController>(
                              builder: (_, signUpController, child) {
                            return TextFormField(
                              enabled: !signUpController.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: joao@gmail.com',
                                  errorText: signUpController.emailError),
                              onChanged: signUpController.setEmail,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'Celular',
                            subtitle: 'Proteja sua conta.',
                          ),
                          Consumer<SignUpUserController>(
                              builder: (_, signUpController, child) {
                            return TextFormField(
                              enabled: !signUpController.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Exemplo: (99) 99999-9999',
                                  errorText: signUpController.phoneError),
                              keyboardType: TextInputType.phone,
                              onChanged: signUpController.setPhone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()
                              ],
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'Senha',
                            subtitle:
                                'Use letras, números e caracteres especiais.',
                          ),
                          Consumer<SignUpUserController>(
                              builder: (_, signUpController, child) {
                            return TextFormField(
                              enabled: !signUpController.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: signUpController.passwordError),
                              obscureText: true,
                              onChanged: signUpController.setPassword,
                            );
                          }),
                          const SizedBox(height: 16),
                          const FieldTitle(
                            title: 'Confirmar Senha',
                            subtitle: 'Repita a Senha',
                          ),
                          Consumer<SignUpUserController>(
                              builder: (_, signUpController, child) {
                            return TextFormField(
                              enabled: !signUpController.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText:
                                      signUpController.passwordErrorConf),
                              obscureText: true,
                              onChanged: signUpController.setPasswordConf,
                            );
                          }),
                          const SizedBox(height: 16),
                          Consumer<SignUpUserController>(
                              builder: (_, signUpController, child) {
                            return SizedBox(
                              height: 44,
                              child: ElevatedButton(
                                onPressed: signUpController.signUpPressed
                                    as Function()?,
                                child: signUpController.loading
                                    ? const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white))
                                    : const Text('Salvar',
                                        style: TextStyle(fontSize: 18.0)),
                              ),
                            );
                          }),
                          const Divider(color: Colors.black26),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
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
                                      decoration: TextDecoration.underline,
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
            ),
          ),
        ),
      ),
    );
  }
}
