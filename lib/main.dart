import 'package:flutter/material.dart';

import 'package:live_tracking/views/home_screen.dart';

void main() => runApp(LiveTracking());

class LiveTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Live tracking demo",
      home: HomeScreen(),
    );
  }
}
