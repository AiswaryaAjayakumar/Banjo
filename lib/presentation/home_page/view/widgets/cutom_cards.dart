import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';

class CustomCardsScreen extends StatefulWidget {
  const CustomCardsScreen({super.key});

  @override
  State<CustomCardsScreen> createState() => _CustomCardsScreenState();
}

class _CustomCardsScreenState extends State<CustomCardsScreen> {
  final SongDataController songDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final recentlyPlayedSongs = songDataController.recentlyPlayedSongs;

      return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: recentlyPlayedSongs.length,
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemBuilder: (context, index) {
          var song = recentlyPlayedSongs[index];
          return GestureDetector(
            onTap: () {
              songDataController.currentIndex(song.id);
              songDataController.songPlayerController.playLocalAudio(song);
            },
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: QueryArtworkWidget(
                      id: song.id,
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: Icon(
                        Icons.music_note,
                        size: 50,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    song.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    song.artist ?? "Unknown Artist",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
