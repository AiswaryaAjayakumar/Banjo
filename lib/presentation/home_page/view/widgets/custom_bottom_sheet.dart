// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet(
      {super.key,
      required this.songName,
      required this.artist,
      required this.songId});
  final String songName;
  final String artist;

  final int songId;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final SongDataController songDataController = Get.put(SongDataController());
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: ColorConstants.blackColorLogo2,
          ),
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: QueryArtworkWidget(
                            id: songPlayerController
                                    .currentSongDetails.value?.id ??
                                0,
                            type: ArtworkType.AUDIO,
                            nullArtworkWidget: Icon(Icons.music_note_outlined),
                            artworkBorder: BorderRadius.circular(10),
                            artworkFit: BoxFit.cover,
                          )),
                    ),

                    // Container(
                    //   height: 50,
                    //   width: 50,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // ),
                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                width: constraints.maxWidth,
                                child: Text(
                                  widget.songName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: ColorConstants.copperColorLogo1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                width: constraints.maxWidth,
                                child: Text(
                                  widget.artist,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorConstants.customWhite1,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  color: ColorConstants.customWhite1,
                  thickness: .3,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.share_sharp),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Share"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.playlist_add),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Add to Playlist"),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
