// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:music_app/core/constants/color.dart';
// import 'package:music_app/presentation/favourite_page/controller/favourites_controller.dart';
// import 'package:music_app/presentation/home_page/controller/song_data_controller.dart';

// class CustomListedPage extends StatefulWidget {
//   const CustomListedPage({
//     super.key,
//     required this.songName,
//     required this.onPressed,
//     required this.artist,
//   });

//   final String songName;
//   final String artist;
//   final VoidCallback onPressed;

//   @override
//   State<CustomListedPage> createState() => _CustomListedPageState();
// }

// class _CustomListedPageState extends State<CustomListedPage> {
//   SongDataController songDataController = Get.put(SongDataController());

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       physics: ScrollPhysics(),
//       itemBuilder: (context, index) => InkWell(
//         onTap: widget.onPressed,
//         child: Container(
//           height: MediaQuery.of(context).size.height / 12,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: ColorConstants.containerOrange,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage("assets/images/Iphone.jpeg"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 18),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       LayoutBuilder(
//                         builder: (context, constraints) {
//                           return Container(
//                             width: constraints.maxWidth,
//                             child: Text(
//                               widget.songName,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       LayoutBuilder(
//                         builder: (context, constraints) {
//                           return Container(
//                             width: constraints.maxWidth,
//                             child: Text(
//                               widget.artist,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: ColorConstants.customGrey1,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       separatorBuilder: (context, index) => SizedBox(height: 10),
//       itemCount: 1,
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';

import 'package:music_app/core/constants/color.dart';


class CustomListedPage extends StatefulWidget {
  const CustomListedPage({
    Key? key,
    required this.songName,
    required this.artist,
    required this.onPressed,
  }) : super(key: key);

  final String songName;
  final String artist;
  final VoidCallback onPressed;

  @override
  State<CustomListedPage> createState() => _CustomListedPageState();
}

class _CustomListedPageState extends State<CustomListedPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.containerOrange,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/Iphone.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 18),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.songName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                        height:
                            4), // Added spacing between song name and artist
                    Text(
                      widget.artist,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstants.customGrey1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
