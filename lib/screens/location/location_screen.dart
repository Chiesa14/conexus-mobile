import 'package:conexus/screens/location/location_controller.dart';
import 'package:conexus/utils/constants.dart';
import 'package:conexus/widgets/custom_button.dart';
import 'package:conexus/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<ListItem> callItems = LocationController.places.map((call) {
    return ListItem(
      icon: call['icon'],
      title: call['name'],
      description: call['date'],
    );
  }).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomInAppButton(
              text: 'Scan a new place',
              onPressed: () => {},
              iconPath: AppIcons.addLocationIcon,
            ),
            ReusableListWidget(
              overallTitle: "Places",
              items: callItems,
            ),
          ],
        ),
      ),
    );
  }
}
