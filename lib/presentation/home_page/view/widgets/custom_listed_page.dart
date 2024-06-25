// ignore_for_file: prefer_const_constructors

import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CustomListedPage extends StatefulWidget {
  const CustomListedPage({
    super.key,
    required this.songName,
    required this.onPressed,
    required this.artist,
  });

  final String songName;
  final String artist;
  final VoidCallback onPressed;

  @override
  State<CustomListedPage> createState() => _CustomListedPageState();
}

class _CustomListedPageState extends State<CustomListedPage> {
  SongDataController songDataController = Get.put(SongDataController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: widget.onPressed,
          child: Container(
            height: MediaQuery.of(context).size.height / 11,
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorConstants.copperColorLogo1,
                    child: QueryArtworkWidget(
                      id: songDataController.songList[index].id,
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
                                  color: ColorConstants.copperColorLogo2,
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
      separatorBuilder: (context, index) => SizedBox(height: 0),
      itemCount: 1,
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:Banjo/core/constants/color.dart';

// class CustomListedPage extends StatefulWidget {
//   const CustomListedPage({
//     Key? key,
//     required this.songName,
//     required this.artist,
//     required this.onPressed,
//   }) : super(key: key);

//   final String songName;
//   final String artist;
//   final VoidCallback onPressed;

//   @override
//   State<CustomListedPage> createState() => _CustomListedPageState();
// }

// class _CustomListedPageState extends State<CustomListedPage> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: widget.onPressed,
//       child: Container(
//         height: MediaQuery.of(context).size.height / 12,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           // color: ColorConstants.containerOrange,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image: AssetImage(
//                         "assets/images/Screenshot 2024-06-24 at 12.56.36 PM.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 18),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.songName,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: TextStyle(
//                         color: ColorConstants.copperColorLogo1,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                         height:
//                             4), // Added spacing between song name and artist
//                     Text(
//                       widget.artist,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: ColorConstants.copperColorLogo2,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
