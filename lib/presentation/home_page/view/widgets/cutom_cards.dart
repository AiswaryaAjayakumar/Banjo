// ignore_for_file: prefer_const_constructors

import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CustomCardsScreen extends StatelessWidget {
  final SongPlayerController songPlayerController =
      Get.find<SongPlayerController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final recentlyPlayedSongs = songPlayerController.recentlyPlayedSongs;

      return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: recentlyPlayedSongs.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 5,
        ),
        itemBuilder: (context, index) {
          final song = recentlyPlayedSongs[index];
          return Container(
            width: 180,
            color: ColorConstants.copperColorLogo2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display album art
                QueryArtworkWidget(
                  id: song.id,
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget:
                      Icon(Icons.music_note, size: 100, color: Colors.white),
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
                // Display artist name
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
      );
    });
  }
}
