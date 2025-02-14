import 'package:flutter/material.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/custom_button.dart';
import 'package:conexus/widgets/or_widget.dart';
import 'package:conexus/widgets/custom_text_field.dart';
import 'package:conexus/utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Proceed with signup
      print("Valid input! Proceeding with signup...");
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Log in",
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
                    const SizedBox(height: 15),
                    const OrWidget(),
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
                      hintText: "Password",
                      controller: passwordController,
                      iconPath: AppIcons.passwordIcon1,
                      isPassword: true,
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        print("Forgot password");
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Continue button at the bottom
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              text: "Continue",
              onPressed: _submitForm,
            ),
          ),
        ],
      ),
    );
  }
}
