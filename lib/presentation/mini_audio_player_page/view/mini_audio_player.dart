// // ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:Banjo/core/constants/color.dart';
// import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:Banjo/presentation/home_page/view/song_page.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:page_transition/page_transition.dart';

// class MiniAudioPlayerScreen extends StatefulWidget {
//   const MiniAudioPlayerScreen({
//     super.key,
//   });

//   @override
//   State<MiniAudioPlayerScreen> createState() => _MiniAudioPlayerScreenState();
// }

// class _MiniAudioPlayerScreenState extends State<MiniAudioPlayerScreen> {
//   final SongPlayerController songPlayerController =
//       Get.put(SongPlayerController());
//   final SongDataController songDataController = Get.put(SongDataController());

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushReplacement(
//             context,
//             PageTransition(
//                 child: SongPageScreen(
//                details: songPlayerController.currentSongDetails.value
//                 ), type: PageTransitionType.bottomToTop));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: MediaQuery.of(context).size.height / 12,
//           width: MediaQuery.of(context).size.width / 1.1,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: ColorConstants.blackColorLogo2),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Obx(() => Row(
//                           children: [
//                             Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 image: DecorationImage(
//                                   image: AssetImage(
//                                       "assets/images/Screenshot 2024-06-24 at 12.56.36 PM.png"),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 18),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.5,
//                                   child: Text(
//                                     songPlayerController.songTitle.value,
//                                     overflow: TextOverflow.fade,
//                                     maxLines: 1,
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       color: ColorConstants.customWhite,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.5,
//                                   child: Text(
//                                     songPlayerController.songArtist.value,
//                                     //overflow: TextOverflow.fade,
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       color: ColorConstants.customWhite,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )),
//                     Obx(
//                       () => InkWell(
//                         onTap: () {
//                           if (songPlayerController.isPlaying.value) {
//                             songPlayerController.pausePlaying();
//                             // aniController.stop();  // Uncomment if using animation
//                           } else {
//                             songPlayerController.resumePlaying();
//                             // aniController.repeat();  // Uncomment if using animation
//                           }
//                         },
//                         child: CircleAvatar(
//                           radius: 20,
//                           backgroundColor: ColorConstants.customWhite1,
//                           child: Icon(
//                             songPlayerController.isPlaying.value
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                             color: ColorConstants.customGrey1,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Slider(
//                 //   inactiveColor: ColorConstants.customGrey,
//                 //   activeColor: ColorConstants.copperColorLogo1,
//                 //   value: songPlayerController.sliderValue.value
//                 //       .clamp(0.0, songPlayerController.sliderValue.value),
//                 //   onChanged: (value) {
//                 //     songPlayerController.sliderValue.value = value;
//                 //     Duration songPosition = Duration(seconds: value.toInt());
//                 //     songPlayerController.sliderChange(songPosition);
//                 //   },
//                 //   min: 0,
//                 //   max: songPlayerController.sliderMaxValue.value,
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

//new working code
import 'package:Banjo/presentation/home_page/view/song_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:page_transition/page_transition.dart';

class MiniAudioPlayerScreen extends StatefulWidget {
  const MiniAudioPlayerScreen({
    super.key,
  });

  @override
  State<MiniAudioPlayerScreen> createState() => _MiniAudioPlayerScreenState();
}

class _MiniAudioPlayerScreenState extends State<MiniAudioPlayerScreen> {
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());
  final SongDataController songDataController = Get.put(SongDataController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: SongPageScreen(
              details: songPlayerController.currentSongDetails.value,
            ),
            type: PageTransitionType.bottomToTop,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstants.blackColorLogo2,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Obx(() => Row(
                            children: [
                              QueryArtworkWidget(
                                id: songPlayerController
                                        .currentSongDetails.value?.id ??
                                    0,
                                type: ArtworkType.AUDIO,
                                nullArtworkWidget: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      ColorConstants.copperColorLogo1,
                                  child: Icon(
                                    Icons.music_note_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                artworkBorder: BorderRadius.circular(10),
                                artworkFit: BoxFit.cover,
                              ),
                              SizedBox(width: 18),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        songPlayerController.songTitle.value,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              ColorConstants.copperColorLogo1,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        songPlayerController.songArtist.value,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color:
                                              ColorConstants.copperColorLogo2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        songDataController.previousSongPlay();
                      },
                      icon: Icon(
                        Icons.skip_previous,
                        size: 30,
                        color: ColorConstants.customWhite1,
                      ),
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
                          radius: 15,
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
                    IconButton(
                      onPressed: () {
                        songDataController.nextSongPlay();
                      },
                      icon: Icon(
                        Icons.skip_next,
                        size: 30,
                        color: ColorConstants.customWhite1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        SizedBox.shrink();
                      },
                      icon: Icon(
                        Icons.close_outlined,
                        color: ColorConstants.customGrey,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 1, // Adjust track height
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 0.0, // Adjust thumb radius
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 10.0, // Adjust overlay radius
                    ),
                    // Other properties you can customize:
                  ),
                  child: Obx(() => Slider(
                        inactiveColor: ColorConstants.customGrey,
                        activeColor: ColorConstants.copperColorLogo1,
                        value: songPlayerController.sliderValue.value.clamp(
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
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
