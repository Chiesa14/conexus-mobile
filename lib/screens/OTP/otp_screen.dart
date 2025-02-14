import 'package:conexus/screens/intermediate_splash_screen.dart';
import 'package:conexus/utils/custom_page_routes.dart';
import 'package:conexus/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print("Valid input! Proceeding to home...");
      Navigator.push(
          context,
          FadePageRoute(
              widget: const IntermediateSplashScreen(), duration: Duration(milliseconds: 400)));
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
                        "Enter OTP",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "A 4 Digit code has been sent to this number ",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: "+25078923455",
                            style: const TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const TextSpan(
                            text: ", Enter it below.",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    OTPInput(
                      length: 4,
                      onCompleted: (otp) {
                        print("Completed OTP: $otp");
                      },
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
