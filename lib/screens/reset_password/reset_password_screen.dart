import 'package:flutter/material.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/custom_button.dart';
import 'package:conexus/widgets/custom_text_field.dart';
import 'package:conexus/utils/validators.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print("Password is valid! Proceeding...");
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 150),
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Text(
                        "Reset Password",
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
