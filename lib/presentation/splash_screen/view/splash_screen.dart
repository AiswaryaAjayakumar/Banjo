// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/core/constants/color.dart';
import 'package:music_app/core/constants/texts.dart';
import 'package:music_app/global_widgets/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/3756851/pexels-photo-3756851.jpeg?auto=compress&cs=tinysrgb&w=800"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: 60,
          left: 80,
          right: 60,
          child: Text(
            "Find Your Music..",
            style: MytextStyle.customWhiteHeadings4,
          ),
        ),
        Positioned(
            bottom: 80,
            left: 80,
            right: 80,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ColorConstants.customWhite)),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNav(),
                      ));
                },
                child: Text(
                  "Get Started",
                  style: MytextStyle.customWhiteHeadings5,
                )))
      ]),
      // body: Image.network(
      //   "https://images.pexels.com/photos/3574678/pexels-photo-3574678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
