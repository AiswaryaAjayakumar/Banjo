// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:music_app/core/constants/color.dart';
import 'package:music_app/presentation/home_page/controller/song_data_controller.dart';
import 'package:music_app/presentation/home_page/controller/song_player_controller.dart';
import 'package:music_app/presentation/home_page/view/song_page.dart';

class HeroWidgetScreen extends StatefulWidget {
  const HeroWidgetScreen({
    super.key,
  });

  @override
  State<HeroWidgetScreen> createState() => _HeroWidgetScreenState();
}

class _HeroWidgetScreenState extends State<HeroWidgetScreen> {
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());
  final SongDataController songDataController = Get.put(SongDataController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag: "myImage",
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongPageScreen(),
                ));
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    ColorConstants.heroColorCyan,
                    ColorConstants.heroColorBrown,
                    ColorConstants.heroColorGreen,

                    // Color.fromARGB(209, 170, 83, 1),
                    // Color.fromARGB(141, 4, 121, 137),
                    // Color.fromARGB(189, 233, 119, 4),
                    // Color.fromARGB(255, 4, 184, 142),
                    // // Color.fromARGB(209, 170, 83, 1),
                    // Color.fromARGB(189, 233, 119, 4),
                    // Color.fromARGB(141, 4, 121, 137),
                    // Color.fromARGB(189, 233, 119, 4),
                  ]),
              // borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Iphone.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 18),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  songPlayerController.songTitle.value,
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: ColorConstants.customWhite,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  songPlayerController.songArtist.value,
                                  //overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: ColorConstants.customWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        if (songPlayerController.isPlaying.value) {
                          songPlayerController.pausePlaying();
                          // aniController.stop();  // Uncomment if using animation
                        } else {
                          songPlayerController.resumePlaying();
                          // aniController.repeat();  // Uncomment if using animation
                        }
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorConstants.customWhite1,
                        child: Icon(
                          songPlayerController.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: ColorConstants.customGrey1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
