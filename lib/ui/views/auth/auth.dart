import 'package:flutter/material.dart';
import 'package:tybatest/ui/views/auth/login.dart';
import 'package:tybatest/ui/views/auth/signup.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
