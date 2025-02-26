import 'dart:async';
import 'package:conexus/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  bool isRecording = false;
  int seconds = 0;
  Timer? timer;
  final SpeechToText _speech = SpeechToText();
  String _transcribedText = "Hey, I'm happy to meet you! Where are you from?";
  String _userResponse = "";

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    // Request microphone permission
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      final available = await _speech.initialize();
      if (!available) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Speech recognition not available')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission denied')),
      );
    }
  }

  void toggleRecording() {
    if (isRecording) {
      // Stop recording
      timer?.cancel();
      _speech.stop();
      setState(() {
        isRecording = false;
        seconds = 0;
        _transcribedText = _userResponse;
        _userResponse = "";
      });
    } else {
      // Start recording
      setState(() {
        isRecording = true;
        _userResponse = "";
      });
      _speech.listen(
        onResult: (result) => setState(() {
          _userResponse = result.recognizedWords;
        }),
      );
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() => seconds += 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 11, 11, 1),
      body: Stack(
        children: [
          // 3D Viewer
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenSize.height * 0.6,
              child: Flutter3DViewer(
                src: "assets/3D/human_man.glb",
              ),
            ),
          ),
          // Bottom Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenSize.width,
              height: screenSize.height * 0.3,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Conversation Text
                  Text(
                    _transcribedText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  // Real-time User Response
                  if (_userResponse.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "You: $_userResponse",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  // Language Selector and Recording Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLanguageSelector(),
                      _buildRecordingButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Language Selector Widget
  Widget _buildLanguageSelector() {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: Colors.transparent,
          ),
          gradient: const LinearGradient(
            colors: [Color(0xff923cf6), Color(0xffA171DA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black.withOpacity(0.6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(
                  AppIcons.languageIcon,
                  height: 20,
                  colorFilter: const ColorFilter.mode(Color(0xff923cf6), BlendMode.srcIn),
                ),
              ),
              const Text(
                "English",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  // Recording Button Widget
  Widget _buildRecordingButton() {
    return GestureDetector(
      onTap: toggleRecording,
      child: Container(
        padding: isRecording ? EdgeInsets.symmetric(horizontal: 14, vertical: 10) : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: Colors.transparent,
          ),
          gradient: const LinearGradient(
            colors: [Color(0xff923cf6), Color(0xffA171DA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: isRecording
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    AppIcons.microphoneIcon,
                    height: 20,
                  ),
                ],
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppIcons.microphoneIcon,
                      height: 20,
                      colorFilter: const ColorFilter.mode(Color(0xff923cf6), BlendMode.srcIn),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
