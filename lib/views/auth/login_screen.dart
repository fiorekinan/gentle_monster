import 'package:flutter/material.dart';
import 'package:gentle_monster_app/utils/const.dart';
import 'package:gentle_monster_app/utils/validators.dart';
import 'package:gentle_monster_app/views/auth/components/auth_button.dart';
import 'package:gentle_monster_app/views/auth/components/auth_form_field.dart';
import 'package:gentle_monster_app/views/auth/components/social_auth_button.dart';

class LoginScreen extends StatelessWidget {
  // untuk memanggil sebuah validator
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Image.asset('assets/images/gm_logo.png', height: 60, width: 250),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Please enter your details to continue",
              style: TextStyle(fontSize: 16, color: titleColor),
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthFormField(
                    controller: _emailController,
                    label: "",
                    hintText: "Email",
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _passwordController,
                    label: "",
                    hintText: "Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility_off),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Fogot Password",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AuthButton(
                    text: "Sign In",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/catalogue');
                      }
                    },
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 1, color: textColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "or login with",
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 1, color: textColor)),
                    ],
                  ),
                  SizedBox(height: 20),
                  SocialAuthButton(
                    assetIcon: "assets/icons/google_logo.svg",
                    label: "Sign in with Google",
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  SocialAuthButton(
                    assetIcon: "assets/icons/apple_logo.svg",
                    label: "Sign in with Apple",
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: textColor),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/register'),
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
