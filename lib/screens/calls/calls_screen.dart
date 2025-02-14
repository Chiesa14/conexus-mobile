import 'package:conexus/screens/calls/call_controller.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/custom_button.dart';
import 'package:conexus/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  List<ListItem> callItems = CallController.calls.map((call) {
    return ListItem(
      icon: call['icon'],
      title: call['name'],
      description: call['date'],
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomInAppButton(
                text: 'New Call',
                onPressed: () => {},
                iconPath: AppIcons.profile2Icon,
              ),
              ReusableListWidget(
                overallTitle: "Recents",
                items: callItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
