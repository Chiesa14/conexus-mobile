import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/bg_bubble_div.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:conexus/screens/signup/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient with the bubble divs
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(146, 60, 246, 1),
                  Color.fromRGBO(161, 113, 218, 1),
                ],
              ),
            ),
          ),

          BgBubbleDiv(
            left: 200,
            top: -100,
            width: 25,
            height: 200,
            opacity: 0.07,
          ),
          BgBubbleDiv(
            left: screenSize.width / 1.25,
            top: 80,
            width: 25,
            height: 160,
            opacity: 0.07,
          ),
          BgBubbleDiv(
            left: 0,
            top: 100,
            width: 25,
            height: 200,
            opacity: 0.07,
          ),
          BgBubbleDiv(
            left: screenSize.width,
            top: screenSize.height / 3,
            width: 40,
            height: 200,
          ),
          BgBubbleDiv(
            left: -40,
            top: screenSize.height / 1.4,
            width: 40,
            height: 200,
          ),
          BgBubbleDiv(
            left: -50,
            top: screenSize.height / 2,
            width: 30,
            height: 200,
            opacity: 0.15,
          ),
          BgBubbleDiv(
            left: screenSize.width / 2,
            top: screenSize.height / 1.18,
            width: 40,
            height: 200,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.conexusWhiteIcon, height: 150),
                const SizedBox(height: 10),
                const Text(
                  "Conexus",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
