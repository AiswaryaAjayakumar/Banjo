// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:banjo/core/constants/color.dart';
import 'package:banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:banjo/presentation/home_page/view/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CustomBottomPlayListScreen extends StatefulWidget {
  const CustomBottomPlayListScreen({
    super.key,
    required this.songName,
    required this.artist,
    required this.songId,
    required this.onSelectSong,
  });
  final String songName;
  final String artist;
  final int songId;
  final Function(SongModel) onSelectSong;
  @override
  State<CustomBottomPlayListScreen> createState() =>
      _CustomBottomPlayListScreenState();
}

class _CustomBottomPlayListScreenState
    extends State<CustomBottomPlayListScreen> {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  SongDataController songDataController = Get.put(SongDataController());
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            final song = songDataController.songList[index];
            return InkWell(
              // onTap: widget.onPressed,

              child: Container(
                // height: MediaQuery.of(context).size.height / 11,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.blackColorLogo1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        blurStyle: BlurStyle.outer,
                        color: ColorConstants.blackColorLogo2)
                  ],
                  borderRadius: BorderRadius.circular(7),
                  //color: ColorConstants.containerOrange,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: ColorConstants.copperColorLogo1,
                        child: QueryArtworkWidget(
                          id: song.id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: Icon(
                            Icons.music_note_outlined,
                            color: ColorConstants.customWhite,
                          ),
                        ),
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
                                    song.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: ColorConstants.customWhite1,
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
                                    song.artist!,
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
                      IconButton(
                          onPressed: () {
                            widget.onSelectSong(song);
                          },
                          icon: Icon(
                            Icons.add,
                            color: ColorConstants.customWhite1,
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 0),
          itemCount: songDataController.songList.length,
        );
      },
    );
  }
}
