// ignore_for_file: library_private_types_in_public_api

import 'package:conexus/screens/signup/password_screen.dart';
import 'package:conexus/utils/custom_page_routes.dart';
import 'package:flutter/material.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/custom_button.dart';
import 'package:conexus/widgets/or_widget.dart';
import 'package:conexus/widgets/custom_text_field.dart';
import 'package:conexus/utils/validators.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print("Valid input! Proceeding with signup...");

      Navigator.push(context, SlidePageRoute(widget: const PasswordScreen()));
    } else {
      print("Invalid input!");
    }
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
                    const SizedBox(height: 120),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomInAppButton(
                      text: "Sign up with Google",
                      iconPath: AppIcons.googleIcon,
                      color: AppColors.input2Background,
                      textColor: AppColors.secondaryColor,
                      onPressed: _submitForm,
                    ),
                    const OrWidget(),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: "Full names",
                      controller: fullNameController,
                      iconPath: AppIcons.profileIcon,
                      validator: Validators.validateNames,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      hintText: "Email ID",
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: Validators.validateEmail,
                      iconPath: AppIcons.emailIcon,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      hintText: "Phone number",
                      controller: passwordController,
                      iconPath: AppIcons.phoneIcon,
                      validator: Validators.validatePhone,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),

          // Continue button at the bottom
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
