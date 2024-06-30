// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:banjo/presentation/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  if (await Permission.storage.request().isGranted ||
      (await Permission.audio.request().isGranted)) {
    // Permissions granted
  } else {
    // Permissions denied, handle accordingly
    print('Permissions denied');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();

  await Hive.initFlutter();

  var box = await Hive.openBox("fav");
  var boxPlaylist = await Hive.openBox("playlist");
  var boxAddPlaylist = await Hive.openBox("addplaylist");
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
