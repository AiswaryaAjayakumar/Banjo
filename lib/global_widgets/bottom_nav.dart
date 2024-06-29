// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:banjo/presentation/play_list_screen/view/playlist_screen.dart';
import 'package:banjo/presentation/recently_played_screen/view/recently_played_screen.dart';
import 'package:flutter/material.dart';
import 'package:banjo/core/constants/color.dart';
import 'package:banjo/presentation/favourite_page/view/favourite_page.dart';
import 'package:banjo/presentation/home_page/view/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int indexNum = 0;
  List pages = [HomePageScreen(), PlayListScreen(), FavouriteScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        type: BottomNavigationBarType.fixed,
        //fixedColor: ColorConstants.customGrey,
        backgroundColor: ColorConstants.blackColorLogo1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            // backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: "Playlists",
            // backgroundColor: Colors.amber
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: "Favourites",
            // backgroundColor: Colors.amber
          ),
        ],
        currentIndex: indexNum,
        onTap: (value) {
          setState(() {
            indexNum = value;
          });
        },
        iconSize: 20,
        selectedFontSize: 15,
        selectedItemColor: ColorConstants.copperColorLogo1,
        unselectedFontSize: 13,
        unselectedItemColor: ColorConstants.copperColorLogo2,
      ),
      body: pages[indexNum],
    );
  }
}
