import 'package:flutter/material.dart';
import 'package:tybatest/core/application/injector.dart';
import 'package:tybatest/core/models/user.dart';
import 'package:tybatest/core/services/auth_service.dart';
import 'package:tybatest/ui/common/custom_text_field.dart';
import 'package:tybatest/ui/views/search/search.dart';

class LoginBody extends StatefulWidget {
  final PageController pageAuthController;

  const LoginBody({required this.pageAuthController, Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      child: Form(
          key: loginFormKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
            CustomTextField(hintText: 'Introduce correo', onChangeCallback: (value) => setState(() => email = value)),
            const SizedBox(height: 10),
            CustomTextField(hintText: 'Introduce contraseña', onChangeCallback: (value) => setState(() => password = value)),
            ElevatedButton(
                child: const Text('Entrar'),
                onPressed: () async {
                  User? user = await locator<IAuthRepository>().logIn(email, password);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SearchView()));
                  }
                }),
            const SizedBox(height: 20),
            TextButton(
                child: const Text('No tengo cuenta'),
                onPressed: () {
                  widget.pageAuthController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                }),
          ])),
    );
  }
}
