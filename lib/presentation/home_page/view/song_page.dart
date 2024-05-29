// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/core/constants/color.dart';
import 'package:music_app/core/constants/texts.dart';
import 'package:music_app/global_widgets/bottom_nav.dart';
import 'package:music_app/presentation/home_page/controller/song_player_controller.dart';
import 'package:music_app/presentation/home_page/view/home_page.dart';

class SongPageScreen extends StatefulWidget {
  const SongPageScreen(
      {super.key, required this.songName, required this.songArtist});
  final String songName;
  final String songArtist;

  @override
  State<SongPageScreen> createState() => _SongPageScreenState();
}

class _SongPageScreenState extends State<SongPageScreen> {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  ColorConstants.gradientColor1,
                  ColorConstants.gradientColor2,
                  ColorConstants.gradientColor1,
                  ColorConstants.gradientColor3,
                  ColorConstants.gradientColor2,
                  ColorConstants.gradientColor4,
                  ColorConstants.gradientColor2,
                  ColorConstants.gradientColor3,
                  ColorConstants.gradientColor1,
                  ColorConstants.gradientColor2,
                ])),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height / 1.8,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://m.media-amazon.com/images/M/MV5BYzY0OTVhZTMtYjAzNy00ODYzLTkxMzUtZmY2MWRlNTE1N2UyXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.songName,
                    style: MytextStyle.customWhiteHeadings,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.songArtist,
                    style: MytextStyle.customWhiteHeadings1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => Slider(
                      inactiveColor: ColorConstants.customWhite,
                      activeColor: ColorConstants.customBlack1,
                      value: songPlayerController.sliderValue.value,
                      onChanged: (value) {
                        songPlayerController.sliderValue.value = value;
                      },
                      min: 0,
                      max: 100,
                    ),
                  ),
                  // LinearProgressIndicator(
                  //   backgroundColor: ColorConstants.customBlack,
                  //   value: 9,
                  //   borderRadius: BorderRadius.circular(10),
                  //   color: ColorConstants.customWhite,
                  // ),
                  // Container(
                  //   height: 3,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(5),
                  //       color: ColorConstants.customWhite),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shuffle,
                              size: 40,
                              color: ColorConstants.customWhite1,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_previous,
                                size: 40, color: ColorConstants.customWhite1)),
                        Obx(
                          () => songPlayerController.isPlaying.value
                              ? InkWell(
                                  onTap: () {
                                    songPlayerController.pausePlaying();
                                  },
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorConstants.customWhite1,
                                      child: Icon(Icons.pause,
                                          color: ColorConstants.customGrey1)),
                                )
                              : InkWell(
                                  onTap: () {
                                    songPlayerController.resumePlaying();
                                  },
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorConstants.customWhite1,
                                      child: Icon(Icons.play_arrow,
                                          color: ColorConstants.customGrey1)),
                                ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_next,
                                size: 40, color: ColorConstants.customWhite1)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline,
                                size: 40, color: ColorConstants.customWhite1))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            // left: 3,
            top: 6,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: IconButton(
                  color: ColorConstants.customWhite,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNav(),
                        ));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
