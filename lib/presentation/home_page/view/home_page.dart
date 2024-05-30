// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_protected_member

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/core/constants/color.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'https://images.pexels.com/photos/18573074/pexels-photo-18573074/free-photo-of-white-wire-earphones-on-black.jpeg?auto=compress&cs=tinysrgb&w=800',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Center(
          child: ClipRect(
            // Clip widget to contain the blur to one widget
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), // The filter
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.1),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                                leading: CircleAvatar(
                              radius: 20,
                            )),
                            Container(
                              height: 50,
                              // width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      const Color.fromARGB(255, 145, 143, 143)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 200,
                                    // color: Colors.amber,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: TextFormField(
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
                                      songDataController.isDeviceSongs.value =
                                          false;
                                    },
                                    child: Text(
                                      "Cloud Songs",
                                      style: GoogleFonts.nunitoSans(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: songDataController
                                                      .isDeviceSongs.value
                                                  ? ColorConstants.customGrey
                                                  : ColorConstants
                                                      .customWhite)),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      songDataController.isDeviceSongs.value =
                                          true;
                                    },
                                    child: Text(
                                      "Device Songs",
                                      style: GoogleFonts.nunitoSans(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: songDataController
                                                      .isDeviceSongs.value
                                                  ? ColorConstants.customWhite
                                                  : ColorConstants
                                                      .customGrey3)),
                                    ),
                                  )
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
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
                                                        .playLocalAudio(e.data);
                                                    Get.to(() => SongPageScreen(
                                                          songName: e.title,
                                                          songArtist: e.artist!,
                                                        ));
                                                  },
                                                ))
                                            .toList(),
                                      )
                                    : Column(
                                        children: [
                                          //CustomListedPage(),
                                        ],
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
