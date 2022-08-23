import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String selectedCity;

  LocationWidget({@required this.selectedCity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        selectedCity,
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}
