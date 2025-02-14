// ignore_for_file: use_build_context_synchronously
import 'package:conexus/screens/main_screen.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/utils/custom_page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntermediateSplashScreen extends StatefulWidget {
  const IntermediateSplashScreen({super.key});

  @override
  State<IntermediateSplashScreen> createState() => _IntermediateSplashScreenState();
}

class _IntermediateSplashScreenState extends State<IntermediateSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        FadePageRoute(widget: const MainScreen(), duration: Duration(milliseconds: 400)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.conexusWhiteIcon, height: 150),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
