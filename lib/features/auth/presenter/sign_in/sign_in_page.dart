import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';

import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final color = Theme.of(context).accentColor;

    return Scaffold(
      appBar: AppBar(title: const Text('Entrar')),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
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
                      padding:
                          const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Consumer<SignInController>(
                        builder: (_, signInController, child) {
                      return TextFormField(
                        enabled: !signInController.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: signInController.emailError),
                        onChanged: signInController.setEmail,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                      );
                    }),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Senha',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: color,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Consumer<SignInController>(
                        builder: (_, signInController, child) {
                      return TextFormField(
                        enabled: !signInController.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: signInController.passwordError),
                        obscureText: true,
                        onChanged: signInController.setPassword,
                      );
                    }),
                    const SizedBox(height: 20),
                    Consumer<SignInController>(
                        builder: (_, signInController, child) {
                      return SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed:
                              signInController.loginPressed as Function()?,
                          child: signInController.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white))
                              : const Text('Entrar',
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
                          const Text('Não tem uma conta? ',
                              style: TextStyle(fontSize: 16)),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(signUpRouter);
                            },
                            child: Text(
                              'Cadastre-se',
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
            ),
          ),
        ),
      ),
    );
  }
}
