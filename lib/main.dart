// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app/global_widgets/bottom_nav.dart';

void main() {
  runApp(MyMusic());
}

class MyMusic extends StatelessWidget {
  const MyMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}
