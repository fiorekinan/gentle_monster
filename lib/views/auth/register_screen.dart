import 'package:flutter/material.dart';
import 'package:owala_app/utils/const.dart';
import 'package:owala_app/utils/validators.dart';
import 'package:owala_app/views/auth/components/auth_button.dart';
import 'package:owala_app/views/auth/components/auth_form_field.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Image.asset('assets/images/gm_logo.png', height: 60, width: 250),
            SizedBox(height: 30),
            Text(
              "Register",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Please create an account to continue",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthFormField(
                    controller: _nameController,
                    label: "",
                    hintText: "Fullname",
                    validator: Validators.validateFullname,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _emailController,
                    label: "",
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _passwordController,
                    label: "",
                    hintText: "Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _confirmPasswordController,
                    label: "",
                    hintText: "Confirm Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility),
                    validator: (value) => Validators.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                  ),
                  SizedBox(height: 50),
                  AuthButton(
                    text: "Sign Up",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/catalogue');
                      }
                    },
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: textColor),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: Text(
                          "Sign In",
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
