import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/app_raised_button.dart';
import '../widgets/app_text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  String validateEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  String validatePassword(String value) =>
      value.length < 6 ? 'Password should be more than 5 Characters' : null;

  void navigateToHomeScreen(BuildContext context) {
    if (formKey.currentState.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg-one.png'),
              fit: BoxFit.fill,
            ),
          ),
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                  Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  AppTextField(
                    labelText: 'Email',
                    prefixIconData: Icons.mail_outline,
                    validator: validateEmail,
                  ),
                  SizedBox(height: 16.0),
                  AppTextField(
                    labelText: 'Password',
                    prefixIconData: Icons.lock_outline,
                    obscureText: true,
                    validator: validatePassword,
                  ),
                  SizedBox(height: 24.0),
                  AppRaisedButton(
                    labelText: 'Log in to your account',
                    onPressed: () => navigateToHomeScreen(context),
                  ),
                  SizedBox(height: 24.0),
                  Text.rich(
                    TextSpan(
                      text: 'I don\'t have account? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(color: Colors.blue.shade300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
