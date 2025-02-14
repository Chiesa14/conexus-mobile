import 'package:flutter/material.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/custom_button.dart';
import 'package:conexus/widgets/or_widget.dart';
import 'package:conexus/widgets/custom_text_field.dart';
import 'package:conexus/utils/validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                    const SizedBox(height: 10),
                    Text(
                      "Don’t worry it happens. Please enter the email address associated with your account.",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Email ID",
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: Validators.validateEmail,
                      iconPath: AppIcons.emailIcon,
                    ),
                    const OrWidget(),
                    CustomTextField(
                      hintText: "Phone number",
                      controller: passwordController,
                      iconPath: AppIcons.phoneIcon,
                      validator: Validators.validatePhone,
                    ),
                    const SizedBox(height: 8),
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
