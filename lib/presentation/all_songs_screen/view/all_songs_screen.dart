// ignore_for_file: prefer_const_constructors

import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/core/constants/texts.dart';

import 'package:Banjo/presentation/mini_audio_player_page/view/mini_audio_player.dart';
import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:Banjo/presentation/home_page/view/song_page.dart';
import 'package:Banjo/presentation/home_page/view/widgets/custom_listed_page.dart';
import 'package:Banjo/presentation/search_songs/view/search_screen.dart';
import 'package:Banjo/presentation/settings_screen/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllSongsScreen extends StatefulWidget {
  const AllSongsScreen({Key? key}) : super(key: key);

  @override
  State<AllSongsScreen> createState() => _AllSongsScreenState();
}

class _AllSongsScreenState extends State<AllSongsScreen> {
  final SongDataController songDataController = Get.put(SongDataController());
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.blackColorLogo1,
        leading: Image.asset(
            "assets/images/Screenshot 2024-06-24 at 12.56.36 PM.png"),
        title: Text(
          "Banjo",
          style: MytextStyle.customWhiteHeadings8,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration:
                    BoxDecoration(color: ColorConstants.blackColorLogo1),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Obx(
                      //   () => Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       // TextButton(
                      //       //   onPressed: () {
                      //       //     songDataController.isDeviceSongs.value = true;
                      //       //   },
                      //       //   child: Text(
                      //       //     "Device Songs",
                      //       //     style: TextStyle(
                      //       //       fontSize: 20,
                      //       //       fontWeight: FontWeight.w400,
                      //       //       color: songDataController.isDeviceSongs.value
                      //       //           ? ColorConstants.copperColorLogo3
                      //       //           : ColorConstants.customWhite,
                      //       //     ),
                      //       //   ),
                      //       // ),
                      //       // Uncomment and use the Favourite Songs button if needed
                      //       // TextButton(
                      //       //   onPressed: () {
                      //       //     songDataController.isDeviceSongs.value = false;
                      //       //   },
                      //       //   child: Text(
                      //       //     "Favourite Songs",
                      //       //     style: TextStyle(
                      //       //       fontSize: 20,
                      //       //       fontWeight: FontWeight.w400,
                      //       //       color: songDataController.isDeviceSongs.value
                      //       //           ? ColorConstants.customWhite
                      //       //           : ColorConstants.homeText,
                      //       //     ),
                      //       //   ),
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Obx(
                          () => songDataController.isDeviceSongs.value
                              ? Column(
                                  children: [
                                    ...songDataController.songList.value
                                        .map(
                                          (e) => Column(
                                            children: [
                                              CustomListedPage(
                                                songName: e.title,
                                                artist: e.artist!,
                                                songId: e.id,
                                                onPressed: () {
                                                  songPlayerController
                                                      .playLocalAudio(e);
                                                  songDataController
                                                      .currentIndex(e.id);
                                                  Get.to(() => SongPageScreen(
                                                      details: e));
                                                },
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                    SizedBox(
                                        height:
                                            20), // Adjust the height as needed
                                  ],
                                )
                              : Column(
                                  // Uncomment and use the FavouriteScreen if needed
                                  // children: [
                                  //   Container(
                                  //     height: MediaQuery.of(context).size.height,
                                  //     child: FavouriteScreen(),
                                  //   ),
                                  // ],
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => songPlayerController.isSongLoaded.value
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: MiniAudioPlayerScreen(),
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
