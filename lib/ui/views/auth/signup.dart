import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tybatest/core/application/injector.dart';
import 'package:tybatest/core/models/user.dart';
import 'package:tybatest/core/services/auth_service.dart';
import 'package:tybatest/ui/common/custom_text_field.dart';
import 'package:tybatest/ui/views/search/search.dart';

class SignUpBody extends StatefulWidget {
  final PageController pageAuthController;
  const SignUpBody({required this.pageAuthController, Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final signUpFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      child: Form(
          key: signUpFormKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
            CustomTextField(hintText: 'Introduce correo', onChangeCallback: (value) => setState(() => email = value)),
            const SizedBox(height: 10),
            CustomTextField(hintText: 'Introduce contraseña', onChangeCallback: (value) => setState(() => password = value)),
            ElevatedButton(
                child: const Text('Registrarme'),
                onPressed: () async {
                  User? user = await locator<IAuthRepository>().signUp(email, password);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SearchView()));
                  }
                }),
          ])),
    );
  }
}
