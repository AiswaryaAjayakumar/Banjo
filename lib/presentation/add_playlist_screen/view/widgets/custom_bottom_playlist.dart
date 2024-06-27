// ignore_for_file: prefer_const_constructors

import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:Banjo/presentation/home_page/view/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CustomBottomPlayListScreen extends StatefulWidget {
  const CustomBottomPlayListScreen(
      {super.key,
      required this.songName,
     
      required this.artist,
      required this.songId});
  final String songName;
  final String artist;
 

  final int songId;
  @override
  State<CustomBottomPlayListScreen> createState() =>
      _CustomBottomPlayListScreenState();
}

class _CustomBottomPlayListScreenState
    extends State<CustomBottomPlayListScreen> {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return  ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
         // onTap: widget.onPressed,
         
          child: Container(
            // height: MediaQuery.of(context).size.height / 11,
            decoration: BoxDecoration(
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorConstants.copperColorLogo1,
                    child: QueryArtworkWidget(
                      id: widget.songId,
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
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => CustomBottomSheet(
                            artist: widget.artist,
                            songId: widget.songId,
                            songName: widget.songName,
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.more_vert_outlined,
                        color: ColorConstants.customWhite1,
                      ))
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 0),
      itemCount: 1,
    );
      },
    );
  }
}
