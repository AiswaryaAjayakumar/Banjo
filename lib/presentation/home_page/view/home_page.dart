// // // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_protected_member

// // import 'dart:ui';

// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:get/get.dart';

// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:Banjo/core/constants/color.dart';
// // import 'package:Banjo/presentation/favourite_page/view/favourite_page.dart';
// // import 'package:Banjo/presentation/hero_widget_page/view/hero_widget_screen.dart';

// // import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// // import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
// // import 'package:Banjo/presentation/home_page/view/song_page.dart';
// // import 'package:Banjo/presentation/home_page/view/widgets/custom_listed_page.dart';

// // class HomePageScreen extends StatefulWidget {
// //   const HomePageScreen({super.key});

// //   @override
// //   State<HomePageScreen> createState() => _HomePageScreenState();
// // }

// // class _HomePageScreenState extends State<HomePageScreen> {
// //   SongDataController songDataController = Get.put(SongDataController());
// //   SongPlayerController songPlayerController = Get.put(SongPlayerController());
// //   //final TextEditingController _searchController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         floatingActionButton:
// //             songPlayerController.isPlaying.value ? HeroWidgetScreen() : null,
// //         // appBar: AppBar(
// //         // bottom: TabBar(tabs: [
// //         //   Tab(
// //         //     child: Text("Songs"),
// //         //   ),
// //         //   Tab(
// //         //     child: Text("Artist"),
// //         //   ),
// //         //   Tab(
// //         //     child: Text("Album"),
// //         //   ),
// //         //   Tab(
// //         //     child: Text("Folder"),
// //         //   ),
// //         // ]),
// //         //backgroundColor: Colors.grey,
// //         // title: Text("My Music"),
// //         // actions: [
// //         //   IconButton(
// //         //     onPressed: () {},
// //         //     icon: Icon(Icons.account_circle),
// //         //   ),
// //         // ],
// //         // ),
// //         body: SafeArea(
// //           child: Stack(
// //             children: [
// //               Image.network(
// //                 'https://i.pinimg.com/564x/3b/52/46/3b524657f01fc92110efa4317d85a979.jpg',
// //                 width: MediaQuery.of(context).size.width,
// //                 height: MediaQuery.of(context).size.height,
// //                 fit: BoxFit.cover,
// //               ),
// //               Center(
// //                 child: ClipRect(
// //                   // Clip widget to contain the blur to one widget
// //                   child: BackdropFilter(
// //                     filter:
// //                         ImageFilter.blur(sigmaX: 7, sigmaY: 7), // The filter
// //                     child: SingleChildScrollView(
// //                       child: Padding(
// //                         padding: const EdgeInsets.symmetric(
// //                             horizontal: 10, vertical: 10),
// //                         child: Container(
// //                           height: MediaQuery.sizeOf(context).height,
// //                           decoration: BoxDecoration(
// //                             color: Colors.grey.shade100.withOpacity(0.1),
// //                           ),
// //                           child: SingleChildScrollView(
// //                             child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   SizedBox(
// //                                     height: 10,
// //                                   ),
// //                                   Obx(
// //                                     () => Row(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.spaceBetween,
// //                                       children: [
// //                                         TextButton(
// //                                           onPressed: () {
// //                                             songDataController
// //                                                 .isDeviceSongs.value = true;
// //                                           },
// //                                           child: Text(
// //                                             "Device Songs",
// //                                             style: GoogleFonts.nunitoSans(
// //                                                 textStyle: TextStyle(
// //                                                     fontSize: 20,
// //                                                     fontWeight: FontWeight.w400,
// //                                                     color: songDataController
// //                                                             .isDeviceSongs.value
// //                                                         ? Color.fromARGB(
// //                                                             255, 27, 236, 229)
// //                                                         : ColorConstants
// //                                                             .customWhite)),
// //                                           ),
// //                                         ),
// //                                         TextButton(
// //                                           onPressed: () {
// //                                             songDataController
// //                                                 .isDeviceSongs.value = false;
// //                                           },
// //                                           child: Text(
// //                                             "Favourite Songs",
// //                                             style: GoogleFonts.nunitoSans(
// //                                                 textStyle: TextStyle(
// //                                                     fontSize: 20,
// //                                                     fontWeight: FontWeight.w400,
// //                                                     color: songDataController
// //                                                             .isDeviceSongs.value
// //                                                         ? ColorConstants
// //                                                             .customWhite
// //                                                         : ColorConstants
// //                                                             .homeText)),
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   Padding(
// //                                       padding: const EdgeInsets.symmetric(
// //                                           horizontal: 4),
// //                                       child: Obx(() => songDataController
// //                                               .isDeviceSongs.value
// //                                           ? Column(
// //                                               children: songDataController
// //                                                   .songList.value
// //                                                   .map((e) => CustomListedPage(
// //                                                         songName: e.title,
// //                                                         artist: e.artist!,
// //                                                         onPressed: () {
// //                                                           songPlayerController
// //                                                               .playLocalAudio(
// //                                                                   e);

// //                                                           songDataController
// //                                                               .currentIndex(
// //                                                                   e.id);

// //                                                           Get.to(() =>
// //                                                               SongPageScreen(
// //                                                                 details: e,
// //                                                               ));
// //                                                         },
// //                                                       ))
// //                                                   .toList(),
// //                                             )
// //                                           : Column(
// //                                               children: [
// //                                                 Container(
// //                                                     height: MediaQuery.sizeOf(
// //                                                             context)
// //                                                         .height,
// //                                                     child: FavouriteScreen())
// //                                               ],
// //                                             )))
// //                                 ]),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ));
// //   }
// // }

// // ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member

// import 'dart:ui';

// import 'package:Banjo/core/constants/color.dart';
// import 'package:Banjo/presentation/favourite_page/view/favourite_page.dart';
// import 'package:Banjo/presentation/mini_audio_player_page/view/mini_audio_player.dart';
// import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:Banjo/presentation/home_page/view/song_page.dart';
// import 'package:Banjo/presentation/home_page/view/widgets/custom_listed_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomePageScreen extends StatefulWidget {
//   const HomePageScreen({Key? key}) : super(key: key);

//   @override
//   State<HomePageScreen> createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends State<HomePageScreen> {
//   final SongDataController songDataController = Get.put(SongDataController());
//   final SongPlayerController songPlayerController =
//       Get.put(SongPlayerController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: songPlayerController.isPlaying.value
//           ? MiniAudioPlayerScreen()
//           : null,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Stack(children: [
//             Container(
//               height: MediaQuery.of(context).size.height,
//               decoration: BoxDecoration(color: ColorConstants.blackColorLogo1),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 10),
//                     Obx(
//                       () => Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               songDataController.isDeviceSongs.value = true;
//                             },
//                             child: Text(
//                               "Device Songs",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w400,
//                                 color: songDataController.isDeviceSongs.value
//                                     ? ColorConstants.copperColorLogo3
//                                     : ColorConstants.customWhite,
//                               ),
//                             ),
//                           ),
//                           // TextButton(
//                           //   onPressed: () {
//                           //     songDataController.isDeviceSongs.value =
//                           //         false;
//                           //   },
//                           //   child: Text(
//                           //     "Favourite Songs",
//                           //     style: TextStyle(
//                           //       fontSize: 20,
//                           //       fontWeight: FontWeight.w400,
//                           //       color: songDataController
//                           //               .isDeviceSongs.value
//                           //           ? ColorConstants.customWhite
//                           //           : ColorConstants.homeText,
//                           //     ),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: Obx(
//                         () => songDataController.isDeviceSongs.value
//                             ? Column(
//                                 children: songDataController.songList.value
//                                     .map(
//                                       (e) => Column(
//                                         children: [
//                                           CustomListedPage(
//                                             songName: e.title,
//                                             artist: e.artist!,
//                                             onPressed: () {
//                                               songPlayerController
//                                                   .playLocalAudio(e);
//                                               songDataController
//                                                   .currentIndex(e.id);
//                                               Get.to(() => SongPageScreen(
//                                                     details: e,
//                                                   ));
//                                             },
//                                           ),
//                                           SizedBox(height: 10),
//                                         ],
//                                       ),
//                                     )
//                                     .toList(),
//                               )
//                             : Column(
//                                 // children: [
//                                 //   Container(
//                                 //     height: MediaQuery.of(context)
//                                 //         .size
//                                 //         .height,
//                                 //     child: FavouriteScreen(),
//                                 //   ),
//                                 // ],
//                                 ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

//new working code
// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member, prefer_const_literals_to_create_immutables

// import 'package:Banjo/core/constants/color.dart';
// import 'package:Banjo/core/constants/texts.dart';
// import 'package:Banjo/presentation/home_page/view/widgets/cutom_cards.dart';

// import 'package:Banjo/presentation/mini_audio_player_page/view/mini_audio_player.dart';
// import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:Banjo/presentation/home_page/view/song_page.dart';
// import 'package:Banjo/presentation/home_page/view/widgets/custom_listed_page.dart';
// import 'package:Banjo/presentation/search_songs/view/search_screen.dart';
// import 'package:Banjo/presentation/settings_screen/view/settings_screen.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:page_transition/page_transition.dart';

// class HomePageScreen extends StatefulWidget {
//   const HomePageScreen({Key? key}) : super(key: key);

//   @override
//   State<HomePageScreen> createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends State<HomePageScreen> {
//   final SongDataController songDataController = Get.put(SongDataController());
//   final SongPlayerController songPlayerController =
//       Get.put(SongPlayerController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstants.blackColorLogo1,
//       appBar: AppBar(
//         backgroundColor: ColorConstants.blackColorLogo1,
//         leading: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                   image: AssetImage("assets/images/bnew.jpeg"),
//                   fit: BoxFit.cover)),
//         ),
//         title: Text(
//           "Welcome",
//           style: MytextStyle.customWhiteHeadings8,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SearchScreen(),
//                   ));
//             },
//             icon: Icon(
//               Icons.search_outlined,
//               color: ColorConstants.customWhite1,
//               size: 28,
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       PageTransition(
//                           child: SettingScreen(),
//                           type: PageTransitionType.rightToLeft,
//                           curve: Curves.bounceOut,
//                           duration: Duration(seconds: 1)),
//                       (route) => false);
//                 },
//                 icon: Icon(
//                   Icons.settings,
//                   size: 28,
//                   color: ColorConstants.customWhite1,
//                 ),
//               ))
//         ],
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 decoration:
//                     BoxDecoration(color: ColorConstants.blackColorLogo1),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 15),
//                       Container(height: 200, child: CustomCardsScreen()),

//                       // Obx(
//                       //   () => Row(
//                       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //     children: [
//                       //       // TextButton(
//                       //       //   onPressed: () {
//                       //       //     songDataController.isDeviceSongs.value = true;
//                       //       //   },
//                       //       //   child: Text(
//                       //       //     "Device Songs",
//                       //       //     style: TextStyle(
//                       //       //       fontSize: 20,
//                       //       //       fontWeight: FontWeight.w400,
//                       //       //       color: songDataController.isDeviceSongs.value
//                       //       //           ? ColorConstants.copperColorLogo3
//                       //       //           : ColorConstants.customWhite,
//                       //       //     ),
//                       //       //   ),
//                       //       // ),
//                       //       // Uncomment and use the Favourite Songs button if needed
//                       //       // TextButton(
//                       //       //   onPressed: () {
//                       //       //     songDataController.isDeviceSongs.value = false;
//                       //       //   },
//                       //       //   child: Text(
//                       //       //     "Favourite Songs",
//                       //       //     style: TextStyle(
//                       //       //       fontSize: 20,
//                       //       //       fontWeight: FontWeight.w400,
//                       //       //       color: songDataController.isDeviceSongs.value
//                       //       //           ? ColorConstants.customWhite
//                       //       //           : ColorConstants.homeText,
//                       //       //     ),
//                       //       //   ),
//                       //       // ),
//                       //     ],
//                       //   ),
//                       // ),
//                       SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                         child: Obx(
//                           () => songDataController.isDeviceSongs.value
//                               ? Column(
//                                   children: [
//                                     ...songDataController.songList.value
//                                         .map(
//                                           (e) => Column(
//                                             children: [
//                                               CustomListedPage(
//                                                 songName: e.title,
//                                                 artist: e.artist!,
//                                                 songId: e.id,
//                                                 onPressed: () {
//                                                   songPlayerController
//                                                       .playLocalAudio(e);
//                                                   songDataController
//                                                       .currentIndex(e.id);
//                                                   Get.to(() => SongPageScreen(
//                                                       details: e));
//                                                 },
//                                               ),
//                                               SizedBox(height: 10),
//                                             ],
//                                           ),
//                                         )
//                                         .toList(),
//                                     SizedBox(
//                                         height:
//                                             150), // Adjust the height as needed
//                                   ],
//                                 )
//                               : Column(
//                                   // Uncomment and use the FavouriteScreen if needed
//                                   // children: [
//                                   //   Container(
//                                   //     height: MediaQuery.of(context).size.height,
//                                   //     child: FavouriteScreen(),
//                                   //   ),
//                                   // ],
//                                   ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Obx(
//               () => songPlayerController.isSongLoaded.value
//                   ? Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: MiniAudioPlayerScreen(),
//                     )
//                   : SizedBox.shrink(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/core/constants/texts.dart';
import 'package:Banjo/presentation/home_page/view/widgets/custom_listed_page.dart';
import 'package:Banjo/presentation/home_page/view/widgets/cutom_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:Banjo/presentation/home_page/view/song_page.dart';
import 'package:Banjo/presentation/mini_audio_player_page/view/mini_audio_player.dart';
import 'package:Banjo/presentation/search_songs/view/search_screen.dart';
import 'package:Banjo/presentation/settings_screen/view/settings_screen.dart';
import 'package:page_transition/page_transition.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final SongDataController songDataController = Get.put(SongDataController());
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackColorLogo1,
      appBar: AppBar(
        backgroundColor: ColorConstants.blackColorLogo1,
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage("assets/images/bnew.jpeg"),
                  fit: BoxFit.cover)),
        ),
        title: Text(
          "Welcome",
          style: MytextStyle.customWhiteHeadings8,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
            },
            icon: Icon(
              Icons.search_outlined,
              color: ColorConstants.customWhite1,
              size: 28,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          child: SettingScreen(),
                          type: PageTransitionType.rightToLeft,
                          curve: Curves.bounceOut,
                          duration: Duration(seconds: 1)),
                      (route) => false);
                },
                icon: Icon(
                  Icons.settings,
                  size: 28,
                  color: ColorConstants.customWhite1,
                ),
              ))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration:
                      BoxDecoration(color: ColorConstants.blackColorLogo1),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Center(
                          child: Text(
                            "All Songs",
                            style: MytextStyle.customWhiteHeadings5,
                          ),
                        ),
                        //  Container(height: 200, child: CustomCardsScreen()),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Obx(
                            () => songDataController.isDeviceSongs.value
                                ? Column(
                                    children: [
                                      ...songDataController.songList.value
                                          .map(
                                            (e) => Column(
                                              children: [
                                                CustomListedPage(
                                                  songName: e.title,
                                                  artist: e.artist!,
                                                  songId: e.id,
                                                  onPressed: () {
                                                    songPlayerController
                                                        .playLocalAudio(e);
                                                    songDataController
                                                        .currentIndex(e.id);
                                                    Get.to(() => SongPageScreen(
                                                        details: e));
                                                  },
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                      SizedBox(height: 150),
                                    ],
                                  )
                                : Container(), // Adjust as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
          ],
        ),
      ),
    );
  }
}
