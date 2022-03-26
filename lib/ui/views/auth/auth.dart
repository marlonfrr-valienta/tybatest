import 'package:flutter/material.dart';
import 'package:tybatest/ui/views/auth/login.dart';
import 'package:tybatest/ui/views/auth/signup.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            LoginBody(pageAuthController: _pageController),
            SignUpBody(pageAuthController: _pageController),
          ],
        ),
      ),
    );
  }
}
