import 'package:conexus/screens/OTP/otp_screen.dart';
import 'package:conexus/utils/custom_page_routes.dart';
import 'package:flutter/material.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/custom_button.dart';
import 'package:conexus/widgets/custom_text_field.dart';
import 'package:conexus/utils/validators.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print("Password is valid! Proceeding...");
      Navigator.push(context, SlidePageRoute(widget: const OtpScreen()));
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Secure Your Account",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      hintText: "Password",
                      controller: passwordController,
                      isPassword: true,
                      iconPath: AppIcons.passwordIcon1,
                      validator: Validators.validatePassword,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      hintText: "Confirm Password",
                      controller: confirmPasswordController,
                      isPassword: true,
                      iconPath: AppIcons.passwordIcon2,
                      validator: _validateConfirmPassword,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomInAppButton(
              text: "Continue",
              onPressed: _submitForm,
            ),
          ),
        ],
      ),
    );
  }
}
