// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'dart:async';

import 'package:Banjo/core/constants/texts.dart';
import 'package:Banjo/global_widgets/bottom_nav.dart';
import 'package:Banjo/presentation/home_page/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "assets/images/Default_Prompt_Design_a_3D_effect_logo_The_logo_should_promin_1.jpg"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: 60,
          left: 80,
          right: 60,
          child: Text(
            "Sail the seas of soundscapes..",
            style: MytextStyle.customWhiteHeadings4,
          ),
        ),
        // Positioned(
        //     bottom: 80,
        //     left: 80,
        //     right: 80,
        //     child: ElevatedButton(
        //         style: ButtonStyle(
        //             backgroundColor:
        //                 MaterialStatePropertyAll(ColorConstants.customWhite)),
        //         onPressed: () {

        //         },
        //         child: Text(
        //           "Get Started",
        //           style: MytextStyle.customWhiteHeadings5,
        //         )))
      ]),
      // body: Image.network(
      //   "https://images.pexels.com/photos/3574678/pexels-photo-3574678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
