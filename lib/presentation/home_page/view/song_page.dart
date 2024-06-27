// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

// import 'package:Banjo/core/constants/color.dart';
// import 'package:Banjo/core/constants/texts.dart';
// import 'package:Banjo/presentation/favourite_page/controller/favourites_controller.dart';
// import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:Banjo/presentation/home_page/view/home_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// import 'package:lottie/lottie.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:page_transition/page_transition.dart';

// class SongPageScreen extends StatefulWidget {
//   const SongPageScreen({super.key, this.details, this.songData});

//   final SongModel? details;
//   final Map? songData;
//   @override
//   State<SongPageScreen> createState() => _SongPageScreenState();
// }

// class _SongPageScreenState extends State<SongPageScreen>
//     with SingleTickerProviderStateMixin {
//   int currentIndex = 0;
//   SongPlayerController songPlayerController = Get.put(SongPlayerController());
//   SongDataController songDataController = Get.put(SongDataController());

//   // late AnimationController aniController;
//   // late LottieComposition lotComposition;

//   @override
//   // void initState() {
//   //   super.initState();
//   //   aniController = AnimationController(vsync: this);
//   //   songPlayerController.isPlaying.listen((isPlaying) {
//   //     if (isPlaying) {
//   //       aniController.repeat();
//   //     } else {
//   //       aniController.stop();
//   //     }
//   //   });
//   // }

//   // @override
//   // void dispose() {
//   //   aniController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(children: [
//           Container(
//             height: MediaQuery.sizeOf(context).height,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topRight,
//                   end: Alignment.topLeft,
//                   colors: [
//                     ColorConstants.blackColorLogo1,
//                     ColorConstants.blackColorLogo2
//                   ]),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Container(
//                   //   height: 400,
//                   //   width: MediaQuery.sizeOf(context).width,
//                   //   decoration: BoxDecoration(
//                   //     borderRadius: BorderRadius.circular(10),
//                   //   ),
//                   Flexible(
//                     child: Center(
//                       child: Container(
//                         height: MediaQuery.sizeOf(context).height / 1.8,
//                         width: MediaQuery.sizeOf(context).width,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Flexible(
//                           child: Center(
//                             child: Container(
//                               height: MediaQuery.sizeOf(context).height / 1.8,
//                               width: MediaQuery.sizeOf(context).width,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: QueryArtworkWidget(
//                                 id: widget.details!.id,
//                                 type: ArtworkType.AUDIO,
//                                 nullArtworkWidget:
//                                     Icon(Icons.music_note_outlined),
//                                 artworkBorder: BorderRadius.circular(10),
//                                 artworkFit: BoxFit.cover,
//                               ),
//                             ),
//                             // Lottie.asset(
//                             //   filterQuality: FilterQuality.high,
//                             //   'assets/animations/Animation - 1717130617436.json',
//                             //   fit: BoxFit.fill,
//                             //   controller: aniController,
//                             //   onLoaded: (composition) {
//                             //     aniController.duration = composition.duration;
//                             //     aniController.repeat();
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       // Lottie.asset(
//                       //   filterQuality: FilterQuality.high,
//                       //   'assets/animations/Animation - 1717130617436.json',
//                       //   fit: BoxFit.fill,
//                       //   controller: aniController,
//                       //   onLoaded: (composition) {
//                       //     aniController.duration = composition.duration;
//                       //     aniController.repeat();
//                       //   },
//                       // ),
//                     ),
//                   ),

//                   SizedBox(
//                     height: 30,
//                   ),
//                   Obx(
//                     () => Text(
//                       songPlayerController.songTitle.value,
//                       style: MytextStyle.customWhiteHeadings,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Obx(
//                     () => Text(
//                       songPlayerController.songArtist.value,
//                       style: MytextStyle.customWhiteHeadings1,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Obx(
//                     () => Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           songPlayerController.currentTime.value,
//                           style: TextStyle(color: ColorConstants.customWhite),
//                         ),
//                         Expanded(
//                           child: Slider(
//                             inactiveColor: ColorConstants.customGrey,
//                             activeColor: ColorConstants.copperColorLogo1,
//                             value: songPlayerController.sliderValue.value.clamp(
//                                 0.0, songPlayerController.sliderValue.value),
//                             onChanged: (value) {
//                               songPlayerController.sliderValue.value = value;
//                               Duration songPosition =
//                                   Duration(seconds: value.toInt());
//                               songPlayerController.sliderChange(songPosition);
//                             },
//                             min: 0,
//                             max: songPlayerController.sliderMaxValue.value,
//                           ),
//                         ),
//                         Text(
//                           songPlayerController.totalTime.value,
//                           style: TextStyle(color: ColorConstants.customWhite),
//                         ),
//                       ],
//                     ),
//                   ),

//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             songPlayerController.isFav.value =
//                                 !songPlayerController.isFav.value;
//                             // FavouriteController().addFav(
//                             //     title: widget.details!.title,
//                             //     artist: widget.details!.artist!);

//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //       builder: (context) => FavouriteScreen(),
//                             //     ));

//                             // songPlayerController.shuffledSong();
//                           },
//                           icon: Obx(() => songPlayerController.isFav.value
//                               ? Icon(Icons.favorite,
//                                   size: 40,
//                                   color: ColorConstants.copperColorLogo1)
//                               : Icon(Icons.favorite,
//                                   size: 40,
//                                   color: ColorConstants.customWhite1)),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               songDataController.previousSongPlay();
//                             },
//                             icon: Icon(Icons.skip_previous,
//                                 size: 40, color: ColorConstants.customWhite1)),
//                         Obx(
//                           () => songPlayerController.isPlaying.value
//                               ? InkWell(
//                                   onTap: () {
//                                     songPlayerController.pausePlaying();
//                                     // aniController.stop();
//                                   },
//                                   child: CircleAvatar(
//                                       radius: 30,
//                                       backgroundColor:
//                                           ColorConstants.customWhite1,
//                                       child: Icon(Icons.pause,
//                                           color: ColorConstants.customGrey1)),
//                                 )
//                               : InkWell(
//                                   onTap: () {
//                                     songPlayerController.resumePlaying();
//                                     //aniController.repeat();
//                                   },
//                                   child: CircleAvatar(
//                                       radius: 30,
//                                       backgroundColor:
//                                           ColorConstants.customWhite1,
//                                       child: Icon(Icons.play_arrow,
//                                           color: ColorConstants.customGrey1)),
//                                 ),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               songDataController.nextSongPlay();
//                             },
//                             icon: Icon(Icons.skip_next,
//                                 size: 40, color: ColorConstants.customWhite1)),
//                         IconButton(
//                             onPressed: () {
//                               songPlayerController.repeatSong();
//                             },
//                             icon: Obx(() => Icon(Icons.refresh_outlined,
//                                 size: 40,
//                                 color: songPlayerController.isRepeat.value
//                                     ? ColorConstants.copperColorLogo1
//                                     : ColorConstants.customWhite1)))
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             // left: 3,
//             top: 6,
//             child: CircleAvatar(
//               radius: 25,
//               backgroundColor: Colors.transparent,
//               child: IconButton(
//                   color: ColorConstants.customWhite,
//                   onPressed: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => HomePageScreen(),
//                     //     ));
//                     Navigator.pushReplacement(
//                         context,
//                         PageTransition(
//                             child: HomePageScreen(),
//                             type: PageTransitionType.topToBottom));
//                   },
//                   icon: Icon(
//                     Icons.keyboard_arrow_down,
//                     size: 30,
//                   )),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

//new working code
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:Banjo/global_widgets/bottom_nav.dart';
import 'package:Banjo/presentation/favourite_page/controller/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:page_transition/page_transition.dart';

import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:Banjo/presentation/home_page/view/home_page.dart';

class SongPageScreen extends StatefulWidget {
  const SongPageScreen({Key? key, this.details, this.songData})
      : super(key: key);

  final SongModel? details;
  final Map? songData;

  @override
  State<SongPageScreen> createState() => _SongPageScreenState();
}

class _SongPageScreenState extends State<SongPageScreen>
    with SingleTickerProviderStateMixin {
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());
  final SongDataController songDataController = Get.put(SongDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    ColorConstants.blackColorLogo1,
                    ColorConstants.blackColorLogo2,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(() => QueryArtworkWidget(
                              id: songPlayerController
                                      .currentSongDetails.value?.id ??
                                  0,
                              type: ArtworkType.AUDIO,
                              nullArtworkWidget: Image.asset(
                                "assets/images/Screenshot 2024-06-24 at 12.56.36 PM.png",
                                fit: BoxFit.cover,
                              ),
                              artworkBorder: BorderRadius.circular(10),
                              artworkFit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(height: 30),
                    Obx(
                      () => Text(
                        songPlayerController.songTitle.value,
                        style: TextStyle(
                          color: ColorConstants.copperColorLogo1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Obx(
                      () => Text(
                        songPlayerController.songArtist.value,
                        style: TextStyle(
                          color: ColorConstants.customWhite1,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            songPlayerController.currentTime.value,
                            style: TextStyle(color: ColorConstants.customWhite),
                          ),
                          Expanded(
                            child: Slider(
                              inactiveColor: ColorConstants.customGrey,
                              activeColor: ColorConstants.copperColorLogo1,
                              value:
                                  songPlayerController.sliderValue.value.clamp(
                                0.0,
                                songPlayerController.sliderMaxValue.value,
                              ),
                              onChanged: (value) {
                                songPlayerController.sliderValue.value = value;
                                Duration songPosition =
                                    Duration(seconds: value.toInt());
                                songPlayerController.sliderChange(songPosition);
                              },
                              min: 0,
                              max: songPlayerController.sliderMaxValue.value,
                            ),
                          ),
                          Text(
                            songPlayerController.totalTime.value,
                            style: TextStyle(color: ColorConstants.customWhite),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                    songPlayerController.isFav.value = !songPlayerController.isFav.value;
                    if (songPlayerController.isFav.value) {
                      FavouriteController().addFav(
                        title: songPlayerController.songTitle.value,
                        artist: songPlayerController.songArtist.value,
                      );
                    } else {
      // Optionally, you can remove the song from favorites if needed
      // FavouriteController().removeFav(title: songPlayerController.songTitle.value);
                            }
                          },
                          icon: Obx(
                            () => Icon(
                              Icons.favorite,
                              size: 40,
                              color: songPlayerController.isFav.value
                                  ? ColorConstants.copperColorLogo1
                                  : ColorConstants.customWhite1,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            songDataController.previousSongPlay();
                          },
                          icon: Icon(Icons.skip_previous,
                              size: 40, color: ColorConstants.customWhite1),
                        ),
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              if (songPlayerController.isPlaying.value) {
                                songPlayerController.pausePlaying();
                              } else {
                                songPlayerController.resumePlaying();
                              }
                            },
                            icon: Icon(
                              songPlayerController.isPlaying.value
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 40,
                              color: ColorConstants.customWhite1,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            songDataController.nextSongPlay();
                          },
                          icon: Icon(Icons.skip_next,
                              size: 40, color: ColorConstants.customWhite1),
                        ),
                        IconButton(
                          onPressed: () {
                            songPlayerController.repeatSong();
                          },
                          icon: Obx(
                            () => Icon(
                              Icons.refresh_outlined,
                              size: 40,
                              color: songPlayerController.isRepeat.value
                                  ? ColorConstants.copperColorLogo1
                                  : ColorConstants.customWhite1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 6,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: IconButton(
                  color: ColorConstants.customWhite,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: BottomNav(),
                        type: PageTransitionType.topToBottom,
                        // duration: Duration(seconds: 1)
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
