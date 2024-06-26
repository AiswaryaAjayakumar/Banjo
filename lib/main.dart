// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:Banjo/global_widgets/bottom_nav.dart';
import 'package:Banjo/global_widgets/selected_song.dart';
import 'package:Banjo/presentation/home_page/view/home_page.dart';
import 'package:Banjo/presentation/home_page/view/song_page.dart';
import 'package:Banjo/presentation/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  var box = await Hive.openBox("fav");
  runApp(MyMusic());
}

class MyMusic extends StatelessWidget {
  const MyMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
