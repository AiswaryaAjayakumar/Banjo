// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:banjo/core/constants/color.dart';
import 'package:banjo/presentation/home_page/controller/song_player_controller.dart';

class RecentlyPlayedScreen extends StatefulWidget {
  const RecentlyPlayedScreen({Key? key}) : super(key: key);

  @override
  State<RecentlyPlayedScreen> createState() => _RecentlyPlayedScreenState();
}

class _RecentlyPlayedScreenState extends State<RecentlyPlayedScreen> {
  final SongPlayerController songPlayerController =
      Get.find<SongPlayerController>();

  @override
  Widget build(BuildContext context) {
    final recentlyPlayedSongs = songPlayerController.recentlyPlayedSongs;

    return Scaffold(
      backgroundColor: ColorConstants.blackColorLogo1,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recentlyPlayedSongs.length,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemBuilder: (context, index) {
              final song = recentlyPlayedSongs[index];
              return Container(
                width: 180,
                color: ColorConstants.copperColorLogo2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display album art or default icon
                    QueryArtworkWidget(
                      id: song.id,
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: Icon(Icons.music_note,
                          size: 100, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    // Display song title
                    Text(
                      song.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Display artist name or default text
                    Text(
                      song.artist ?? 'Unknown Artist',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
