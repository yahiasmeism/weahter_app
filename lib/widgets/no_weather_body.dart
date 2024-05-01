import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather 😔 Start',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
