// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_protected_member

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/core/constants/color.dart';
import 'package:music_app/presentation/hero_widget_page/view/hero_widget_screen.dart';

import 'package:music_app/presentation/home_page/controller/song_data_controller.dart';
import 'package:music_app/presentation/home_page/controller/song_player_controller.dart';
import 'package:music_app/presentation/home_page/view/song_page.dart';
import 'package:music_app/presentation/home_page/view/widgets/custom_listed_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  SongDataController songDataController = Get.put(SongDataController());
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  //final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            songPlayerController.isPlaying.value ? HeroWidgetScreen() : null,
        // appBar: AppBar(
        // bottom: TabBar(tabs: [
        //   Tab(
        //     child: Text("Songs"),
        //   ),
        //   Tab(
        //     child: Text("Artist"),
        //   ),
        //   Tab(
        //     child: Text("Album"),
        //   ),
        //   Tab(
        //     child: Text("Folder"),
        //   ),
        // ]),
        //backgroundColor: Colors.grey,
        // title: Text("My Music"),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.account_circle),
        //   ),
        // ],
        // ),
        body: Stack(
          children: [
            Image.network(
              'https://i.pinimg.com/564x/3b/52/46/3b524657f01fc92110efa4317d85a979.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Center(
              child: ClipRect(
                // Clip widget to contain the blur to one widget
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7), // The filter
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100.withOpacity(0.1),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ListTile(
                                //     leading: CircleAvatar(
                                //   radius: 20,
                                // )),
                                Container(
                                  height: 50,
                                  // width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: ColorConstants.containerOrange),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 200,
                                        // color: Colors.amber,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          // controller: _searchController,
                                          decoration: InputDecoration(
                                              hintText: "Search the Music...",
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.search)),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                Obx(
                                  () => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          songDataController
                                              .isDeviceSongs.value = true;
                                        },
                                        child: Text(
                                          "Device Songs",
                                          style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  color: songDataController
                                                          .isDeviceSongs.value
                                                      ? Color.fromARGB(
                                                          255, 27, 236, 229)
                                                      : ColorConstants
                                                          .customWhite)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          songDataController
                                              .isDeviceSongs.value = false;
                                        },
                                        child: Text(
                                          "Favourites",
                                          style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  color: songDataController
                                                          .isDeviceSongs.value
                                                      ? ColorConstants
                                                          .customWhite
                                                      : ColorConstants
                                                          .homeText)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // TabBar(
                                //     dividerColor: Colors.transparent,
                                //     indicatorColor: ColorConstants.customBlack1,
                                //     labelColor: ColorConstants.customWhite,
                                //     unselectedLabelColor:
                                //         ColorConstants.customGrey,
                                //     tabs: [
                                //       Text("Cloud Song"),
                                //       Text("Device Song"),
                                //     ]),
                                // TabBarView(children: [
                                //   Text("hhh"),
                                //   Text("hhh"),
                                //   Text("hhh"),
                                //   Text("hhh"),
                                // ]),
                                // Text(
                                //   "Your Music",
                                //   style: MytextStyle.customWhiteHeadings2,
                                // ),

                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Obx(() => songDataController
                                            .isDeviceSongs.value
                                        ? Column(
                                            children: songDataController
                                                .songList.value
                                                .map((e) => CustomListedPage(
                                                      songName: e.title,
                                                      artist: e.artist!,
                                                      onPressed: () {
                                                        songPlayerController
                                                            .playLocalAudio(e);

                                                        songDataController
                                                            .currentIndex(e.id);

                                                        Get.to(() => SongPageScreen(
                                                            // songName: e.title,
                                                            // songArtist: e.artist!,
                                                            ));
                                                      },
                                                    ))
                                                .toList(),
                                          )
                                        : Column(
                                            children: [],
                                          )))
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
