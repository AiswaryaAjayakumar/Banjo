// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:Banjo/core/constants/color.dart';
// import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:Banjo/presentation/home_page/view/home_page.dart';
// import 'package:Banjo/presentation/home_page/view/song_page.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final SongDataController songDataController = Get.find();
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HomePageScreen(),
//               ),
//             );
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: ColorConstants.customWhite1,
//           ),
//         ),
//         title: TextFormField(
//           controller: _searchController,
//           keyboardType: TextInputType.text,
//           onChanged: (value) {
//             songDataController.setSearchQuery(value);
//           },
//           style: TextStyle(
//             color: ColorConstants.customWhite1,
//           ), // Color of typed text
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             labelStyle: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 18,
//               color: ColorConstants.customWhite1,
//             ),
//             hintText: "Search songs",
//             hintStyle: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 18,
//               color: ColorConstants.customGrey,
//             ),
//           ),
//         ),
//         backgroundColor: ColorConstants.blackColorLogo1,
//         actions: [
//           IconButton(
//             onPressed: () {
//               _searchController.clear();
//               songDataController.setSearchQuery('');
//             },
//             icon: Icon(
//               Icons.close_outlined,
//               size: 20,
//               color: ColorConstants.customWhite1, // Color of the search button
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: ColorConstants.blackColorLogo1,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Expanded(
//               child: Obx(
//                 () => ListView.builder(
//                   itemCount: songDataController.filteredSongs.length,
//                   itemBuilder: (context, index) {
//                     var song = songDataController.filteredSongs[index];
//                     return InkWell(
//                       onTap: () {
//                         songDataController.currentIndex(song.id);
//                         songDataController.songPlayerController
//                             .playLocalAudio(song);
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SongPageScreen(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               blurRadius: 7,
//                               blurStyle: BlurStyle.outer,
//                               color: ColorConstants.blackColorLogo2,
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(7),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CircleAvatar(
//                                 radius: 25,
//                                 backgroundColor:
//                                     ColorConstants.copperColorLogo1,
//                                 child: QueryArtworkWidget(
//                                   id: song.id,
//                                   type: ArtworkType.AUDIO,
//                                   nullArtworkWidget: Icon(
//                                     Icons.music_note_outlined,
//                                     color: ColorConstants.customWhite,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 18),
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     LayoutBuilder(
//                                       builder: (context, constraints) {
//                                         return Container(
//                                           width: constraints.maxWidth,
//                                           child: Text(
//                                             song.title,
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                             style: TextStyle(
//                                               color: ColorConstants
//                                                   .copperColorLogo1,
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                     LayoutBuilder(
//                                       builder: (context, constraints) {
//                                         return Container(
//                                           width: constraints.maxWidth,
//                                           child: Text(
//                                             song.artist!,
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: ColorConstants
//                                                   .copperColorLogo2,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:Banjo/core/constants/color.dart';
// import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:Banjo/presentation/home_page/view/home_page.dart';
// import 'package:Banjo/presentation/home_page/view/song_page.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final SongDataController songDataController = Get.find();
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HomePageScreen(),
//               ),
//             );
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: ColorConstants.customWhite1,
//           ),
//         ),
//         title: TextFormField(
//           controller: _searchController,
//           keyboardType: TextInputType.text,
//           onChanged: (value) {
//             songDataController.setSearchQuery(value);
//           },
//           style: TextStyle(

//             fontSize: 18,
//             color: ColorConstants.copperColorLogo1,
//           ),
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             labelStyle: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 18,
//               color: ColorConstants.customWhite1,
//             ),
//             hintText: "Search songs",
//             hintStyle: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 18,
//               color: ColorConstants.customGrey,
//             ),
//           ),
//         ),
//         backgroundColor: ColorConstants.customBlack2,
//         actions: [
//           IconButton(
//             onPressed: () {
//               _searchController.clear();
//               songDataController.setSearchQuery('');
//             },
//             icon: Icon(
//               Icons.close_outlined,
//               size: 20,
//               color: ColorConstants.customWhite1,
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: ColorConstants.blackColorLogo1,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Expanded(
//               child: Obx(
//                 () => ListView.builder(
//                   itemCount: songDataController.filteredSongs.length,
//                   itemBuilder: (context, index) {
//                     var song = songDataController.filteredSongs[index];
//                     return InkWell(
//                       onTap: () {
//                         songDataController.currentIndex(song.id);
//                         songDataController.songPlayerController
//                             .playLocalAudio(song);
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SongPageScreen(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               blurRadius: 7,
//                               blurStyle: BlurStyle.outer,
//                               color: ColorConstants.blackColorLogo2,
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(7),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CircleAvatar(
//                                 radius: 25,
//                                 backgroundColor:
//                                     ColorConstants.copperColorLogo1,
//                                 child: QueryArtworkWidget(
//                                   id: song.id,
//                                   type: ArtworkType.AUDIO,
//                                   nullArtworkWidget: Icon(
//                                     Icons.music_note_outlined,
//                                     color: ColorConstants.customWhite,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 18),
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     LayoutBuilder(
//                                       builder: (context, constraints) {
//                                         return Container(
//                                           width: constraints.maxWidth,
//                                           child: Text(
//                                             song.title,
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                             style: TextStyle(
//                                               color: ColorConstants
//                                                   .copperColorLogo1,
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                     LayoutBuilder(
//                                       builder: (context, constraints) {
//                                         return Container(
//                                           width: constraints.maxWidth,
//                                           child: Text(
//                                             song.artist!,
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: ColorConstants
//                                                   .copperColorLogo2,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:Banjo/presentation/home_page/view/home_page.dart';
import 'package:Banjo/presentation/home_page/view/song_page.dart';
import 'package:page_transition/page_transition.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SongDataController songDataController = Get.find();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                child: SongPageScreen(),
                type: PageTransitionType.topToBottom,
              ),
              (route) => false,
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorConstants.customWhite1,
          ),
        ),
        title: TextFormField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            songDataController.setSearchQuery(value);
          },
          style: TextStyle(
            fontSize: 18,
            color: ColorConstants.copperColorLogo1,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: ColorConstants.customWhite1,
            ),
            hintText: "Search songs",
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: ColorConstants.customGrey,
            ),
          ),
        ),
        backgroundColor: ColorConstants.customBlack2,
        actions: [
          IconButton(
            onPressed: () {
              _searchController.clear();
              songDataController.setSearchQuery('');
            },
            icon: Icon(
              Icons.close_outlined,
              size: 20,
              color: ColorConstants.customWhite1,
            ),
          ),
        ],
      ),
      backgroundColor: ColorConstants.blackColorLogo1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: songDataController.filteredSongs.length,
                  itemBuilder: (context, index) {
                    var song = songDataController.filteredSongs[index];
                    return InkWell(
                      onTap: () {
                        songDataController.currentIndex(song.id);
                        songDataController.songPlayerController
                            .playLocalAudio(song);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongPageScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              blurStyle: BlurStyle.outer,
                              color: ColorConstants.blackColorLogo2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    ColorConstants.copperColorLogo1,
                                child: QueryArtworkWidget(
                                  id: song.id,
                                  type: ArtworkType.AUDIO,
                                  nullArtworkWidget: Icon(
                                    Icons.music_note_outlined,
                                    color: ColorConstants.customWhite,
                                  ),
                                ),
                              ),
                              SizedBox(width: 18),
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
                                              color: ColorConstants
                                                  .copperColorLogo1,
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
                                              color: ColorConstants
                                                  .copperColorLogo2,
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
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
