import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/core/constants/texts.dart';
import 'package:Banjo/presentation/add_playlist_screen/view/widgets/custom_bottom_playlist.dart';
import 'package:Banjo/presentation/play_list_screen/view/playlist_screen.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';

class AddPlayListScreen extends StatefulWidget {
  const AddPlayListScreen({Key? key}) : super(key: key);

  @override
  State<AddPlayListScreen> createState() => _AddPlayListScreenState();
}

class _AddPlayListScreenState extends State<AddPlayListScreen> {
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController()); // Initialize SongPlayerController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.blackColorLogo1,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayListScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorConstants.customWhite1,
            ),
          ),
          title: Center(
            child: Text(
              "Add Playlist",
              style: MytextStyle.customWhiteHeadings8,
            ),
          ),
        ),
        backgroundColor: ColorConstants.blackColorLogo1,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConstants.copperColorLogo2,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => CustomBottomPlayListScreen(
                songName: songPlayerController.songTitle.value,
                artist: songPlayerController.songArtist.value,
                songId: songPlayerController.currentSongDetails.value?.id ?? 0,
              ),
            );
          },
          child: Icon(Icons.music_note_outlined),
        ));
  }
}
