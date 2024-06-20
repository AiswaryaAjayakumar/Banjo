// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:music_app/core/constants/color.dart';
import 'package:music_app/presentation/home_page/controller/song_data_controller.dart';
import 'package:music_app/presentation/home_page/controller/song_player_controller.dart';

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
    return Hero(
      tag: "myImage",
      child: Container(
        height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorConstants.containerOrange,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                            fontSize: 14,
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
                            fontSize: 12,
                            color: ColorConstants.customGrey1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
              // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
        ),
      ),
    );
  }
}
