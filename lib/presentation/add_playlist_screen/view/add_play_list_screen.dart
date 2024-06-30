// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:banjo/core/constants/color.dart';
// import 'package:banjo/core/constants/texts.dart';
// import 'package:banjo/presentation/add_playlist_screen/view/widgets/custom_bottom_playlist.dart';
// import 'package:banjo/presentation/play_list_screen/view/playlist_screen.dart';
// import 'package:banjo/presentation/home_page/controller/song_player_controller.dart';

// class AddPlayListScreen extends StatefulWidget {
//   const AddPlayListScreen({Key? key}) : super(key: key);

//   @override
//   State<AddPlayListScreen> createState() => _AddPlayListScreenState();
// }

// class _AddPlayListScreenState extends State<AddPlayListScreen> {
//   final SongPlayerController songPlayerController =
//       Get.put(SongPlayerController()); // Initialize SongPlayerController

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: ColorConstants.blackColorLogo1,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PlayListScreen(),
//                 ),
//               );
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: ColorConstants.customWhite1,
//             ),
//           ),
//           title: Center(
//             child: Text(
//               "Add Playlist",
//               style: MytextStyle.customWhiteHeadings8,
//             ),
//           ),
//         ),
//         backgroundColor: ColorConstants.blackColorLogo1,
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: ColorConstants.copperColorLogo2,
//           onPressed: () {
//             showModalBottomSheet(
//               backgroundColor: ColorConstants.blackColorLogo2,
//               context: context,
//               builder: (context) => CustomBottomPlayListScreen(
//                 songName: songPlayerController.songTitle.value,
//                 artist: songPlayerController.songArtist.value,
//                 songId: songPlayerController.currentSongDetails.value?.id ?? 0,
//               ),
//             );
//           },
//           child: Icon(Icons.music_note_outlined),
//         ),
//         body: Expanded(
//             child: ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border(
//                               bottom: BorderSide(
//                                   color: ColorConstants.copperColorLogo2))),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("hh", style: MytextStyle.customWhiteHeadings5),
//                             IconButton(
//                                 onPressed: () {

//                                 },
//                                 icon: Icon(
//                                   Icons.more_vert_outlined,
//                                   color: ColorConstants.customGrey3,
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                   // ListTile(

//                   //     title: Text(playlistController.playlists[index],
//                   //         style: MytextStyle.customWhiteHeadings5),
//                   //     trailing: IconButton(
//                   //       onPressed: () {},
//                   //       icon: Icon(
//                   //         Icons.more_vert_outlined,
//                   //         color: ColorConstants.customGrey3,
//                   //       ),
//                   //     ));
//                 })));
//   }
// }

// import 'package:banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:banjo/core/constants/color.dart';
// import 'package:banjo/core/constants/texts.dart';
// import 'package:banjo/presentation/add_playlist_screen/view/widgets/custom_bottom_playlist.dart';
// import 'package:banjo/presentation/play_list_screen/view/playlist_screen.dart';
// import 'package:banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class AddPlayListScreen extends StatefulWidget {
//   const AddPlayListScreen({Key? key}) : super(key: key);

//   @override
//   State<AddPlayListScreen> createState() => _AddPlayListScreenState();
// }

// class _AddPlayListScreenState extends State<AddPlayListScreen> {
//   final SongPlayerController songPlayerController =
//       Get.put(SongPlayerController());
//   final SongDataController songDataController = Get.put(SongDataController());

//   RxList<SongModel> selectedSongs = <SongModel>[].obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorConstants.blackColorLogo1,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PlayListScreen(),
//               ),
//             );
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: ColorConstants.customWhite1,
//           ),
//         ),
//         title: Center(
//           child: Text(
//             "Add Playlist",
//             style: MytextStyle.customWhiteHeadings8,
//           ),
//         ),
//       ),
//       backgroundColor: ColorConstants.blackColorLogo1,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: ColorConstants.copperColorLogo2,
//         onPressed: () {
//           // Show the bottom sheet to select songs
//           showModalBottomSheet(
//             backgroundColor: ColorConstants.blackColorLogo2,
//             context: context,
//             builder: (context) => CustomBottomPlayListScreen(
//               songName: songPlayerController.songTitle.value,
//               artist: songPlayerController.songArtist.value,
//               songId: songPlayerController.currentSongDetails.value?.id ?? 0,
//               onSelectSong: (selectedSong) {
//                 // Add the selected song to the list
//                 selectedSongs.add(selectedSong);
//               },
//             ),
//           );
//         },
//         child: Icon(Icons.music_note_outlined),
//       ),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: selectedSongs.length,
//           itemBuilder: (context, index) {
//             final song = selectedSongs[index];
//             return InkWell(
//               onTap: () {},
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border(
//                     bottom: BorderSide(
//                       color: ColorConstants.copperColorLogo2,
//                     ),
//                   ),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundColor: ColorConstants.copperColorLogo1,
//                         child: QueryArtworkWidget(
//                           id: song.id,
//                           type: ArtworkType.AUDIO,
//                           nullArtworkWidget: Icon(
//                             Icons.music_note_outlined,
//                             color: ColorConstants.customWhite,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 18,
//                       ),
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             LayoutBuilder(
//                               builder: (context, constraints) {
//                                 return Container(
//                                   width: constraints.maxWidth,
//                                   child: Text(
//                                     song.title,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1,
//                                     style: TextStyle(
//                                       color: ColorConstants.customWhite1,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             LayoutBuilder(
//                               builder: (context, constraints) {
//                                 return Container(
//                                   width: constraints.maxWidth,
//                                   child: Text(
//                                     song.artist!,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1,
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: ColorConstants.customWhite1,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {

//                           },
//                           icon: Icon(
//                             Icons.more_vert_outlined,
//                             color: ColorConstants.customWhite1,
//                           ))
//                     ],
//                   ),

//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

// import 'package:banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:banjo/presentation/home_page/view/song_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:banjo/core/constants/color.dart';
// import 'package:banjo/core/constants/texts.dart';
// import 'package:banjo/presentation/add_playlist_screen/view/widgets/custom_bottom_playlist.dart';
// import 'package:banjo/presentation/play_list_screen/view/playlist_screen.dart';
// import 'package:banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:share_plus/share_plus.dart';

// class AddPlayListScreen extends StatefulWidget {
//   const AddPlayListScreen({Key? key}) : super(key: key);

//   @override
//   State<AddPlayListScreen> createState() => _AddPlayListScreenState();
// }

// class _AddPlayListScreenState extends State<AddPlayListScreen> {
//   final SongPlayerController songPlayerController =
//       Get.put(SongPlayerController());
//   final SongDataController songDataController = Get.put(SongDataController());

//   RxList<SongModel> selectedSongs = <SongModel>[].obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorConstants.blackColorLogo1,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PlayListScreen(),
//               ),
//             );
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: ColorConstants.customWhite1,
//           ),
//         ),
//         title: Center(
//           child: Text(
//             "Add Playlist",
//             style: MytextStyle.customWhiteHeadings8,
//           ),
//         ),
//       ),
//       backgroundColor: ColorConstants.blackColorLogo1,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: ColorConstants.copperColorLogo2,
//         onPressed: () {
//           // Show the bottom sheet to select songs
//           showModalBottomSheet(
//             backgroundColor: ColorConstants.blackColorLogo2,
//             context: context,
//             builder: (context) => CustomBottomPlayListScreen(
//               songName: songPlayerController.songTitle.value,
//               artist: songPlayerController.songArtist.value,
//               songId: songPlayerController.currentSongDetails.value?.id ?? 0,
//               onSelectSong: (selectedSong) {
//                 // Add the selected song to the list
//                 selectedSongs.add(selectedSong);
//               },
//             ),
//           );
//         },
//         child: Icon(Icons.music_note_outlined),
//       ),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: selectedSongs.length,
//           itemBuilder: (context, index) {
//             final song = selectedSongs[index];
//             return InkWell(
//               onTap: () {},
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border(
//                     bottom: BorderSide(
//                       color: ColorConstants.copperColorLogo2,
//                     ),
//                   ),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundColor: ColorConstants.copperColorLogo1,
//                         child: QueryArtworkWidget(
//                           id: song.id,
//                           type: ArtworkType.AUDIO,
//                           nullArtworkWidget: Icon(
//                             Icons.music_note_outlined,
//                             color: ColorConstants.customWhite,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 18,
//                       ),
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             LayoutBuilder(
//                               builder: (context, constraints) {
//                                 return Container(
//                                   width: constraints.maxWidth,
//                                   child: Text(
//                                     song.title,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1,
//                                     style: TextStyle(
//                                       color: ColorConstants.customWhite1,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             LayoutBuilder(
//                               builder: (context, constraints) {
//                                 return Container(
//                                   width: constraints.maxWidth,
//                                   child: Text(
//                                     song.artist!,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1,
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: ColorConstants.customWhite1,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             showBottomSheetOptions(context, song, index);
//                           },
//                           icon: Icon(
//                             Icons.more_vert_outlined,
//                             color: ColorConstants.customWhite1,
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }

//   void showBottomSheetOptions(BuildContext context, SongModel song, int index) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           color: ColorConstants.blackColorLogo2,
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading:
//                     Icon(Icons.play_arrow, color: ColorConstants.customWhite1),
//                 title: Text('Play',
//                     style: TextStyle(color: ColorConstants.customWhite1)),
//                 onTap: () {
//                   songPlayerController.playLocalAudio(song);
//                   Navigator.pop(context);
//                   Get.to(() => SongPageScreen());
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.share, color: ColorConstants.customWhite1),
//                 title: Text('Share',
//                     style: TextStyle(color: ColorConstants.customWhite1)),
//                 onTap: () {
//                   Share.share("${song.title}\n" "${song.artist}");
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.delete, color: ColorConstants.customWhite1),
//                 title: Text('Remove from Playlist',
//                     style: TextStyle(color: ColorConstants.customWhite1)),
//                 onTap: () {
//                   selectedSongs.removeAt(index);
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:banjo/presentation/home_page/view/song_page.dart';
import 'package:banjo/presentation/mini_audio_player_page/view/mini_audio_player.dart';
import 'package:banjo/presentation/play_list_screen/contrller/playlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banjo/core/constants/color.dart';
import 'package:banjo/core/constants/texts.dart';
import 'package:banjo/presentation/add_playlist_screen/view/widgets/custom_bottom_playlist.dart';
import 'package:banjo/presentation/play_list_screen/view/playlist_screen.dart';
import 'package:banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:share_plus/share_plus.dart';

class AddPlayListScreen extends StatefulWidget {
  const AddPlayListScreen({Key? key}) : super(key: key);

  @override
  State<AddPlayListScreen> createState() => _AddPlayListScreenState();
}

class _AddPlayListScreenState extends State<AddPlayListScreen> {
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());
  final SongDataController songDataController = Get.put(SongDataController());

  RxList<SongModel> selectedSongs = <SongModel>[].obs;

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
          // Show the bottom sheet to select songs
          showModalBottomSheet(
            backgroundColor: ColorConstants.blackColorLogo2,
            context: context,
            builder: (context) => CustomBottomPlayListScreen(
              songName: songPlayerController.songTitle.value,
              artist: songPlayerController.songArtist.value,
              songId: songPlayerController.currentSongDetails.value?.id ?? 0,
              onSelectSong: (selectedSong) {
                // Add the selected song to the list
                selectedSongs.add(selectedSong);
              },
            ),
          );
        },
        child: Icon(Icons.music_note_outlined),
      ),
      body: Obx(() {
        return Stack(children: [
          ListView.builder(
            itemCount: selectedSongs.length,
            itemBuilder: (context, index) {
              final song = selectedSongs[index];
              return InkWell(
                onTap: () {
                  songPlayerController.playLocalAudio(song);
                  Get.to(() => SongPageScreen(
                        details: song,
                        fromAddPlaylistScreen: true,
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(
                        color: ColorConstants.copperColorLogo2,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
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
                              showBottomSheetOptions(context, song, index);
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
          ),
          Obx(
            () => songPlayerController.isSongLoaded.value
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: MiniAudioPlayerScreen(),
                  )
                : SizedBox.shrink(),
          ),
        ]);
      }),
    );
  }

  void showBottomSheetOptions(BuildContext context, SongModel song, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: ColorConstants.blackColorLogo2,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading:
                    Icon(Icons.play_arrow, color: ColorConstants.customWhite1),
                title: Text('Play',
                    style: TextStyle(color: ColorConstants.customWhite1)),
                onTap: () {
                  songPlayerController.playLocalAudio(song);
                  Navigator.pop(context);
                  Get.to(() => SongPageScreen(
                        details: song,
                        fromAddPlaylistScreen: true,
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.share, color: ColorConstants.customWhite1),
                title: Text('Share',
                    style: TextStyle(color: ColorConstants.customWhite1)),
                onTap: () {
                  Share.share("${song.title}\n" "${song.artist}");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: ColorConstants.customWhite1),
                title: Text('Remove from Playlist',
                    style: TextStyle(color: ColorConstants.customWhite1)),
                onTap: () {
                  selectedSongs.removeAt(index);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
