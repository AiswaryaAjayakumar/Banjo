// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:Banjo/core/constants/color.dart';

// import 'package:Banjo/presentation/favourite_page/controller/favourites_controller.dart';
// import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:Banjo/presentation/home_page/view/song_page.dart';

// class FavouriteScreen extends StatefulWidget {
//   const FavouriteScreen({Key? key});

//   @override
//   State<FavouriteScreen> createState() => _FavouriteScreenState();
// }

// class _FavouriteScreenState extends State<FavouriteScreen> {
//   FavouriteController favouriteController = Get.put(FavouriteController());
//   SongPlayerController songPlayerController = Get.put(SongPlayerController());
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         physics: ScrollPhysics(),
//         itemBuilder: (context, index) {
//           var favourite = favouriteController.myBox.getAt(index);
//           return InkWell(
//             onTap: () {
//               songPlayerController.playSongFromFavourites(favourite);
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SongPageScreen(
//                       songData: favourite,
//                     ),
//                   ));
//             },
//             child: Container(
//               height: MediaQuery.of(context).size.height / 12,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: ColorConstants.containerOrange,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                               image: AssetImage("assets/images/Iphone.jpeg"),
//                               fit: BoxFit.cover)),
//                     ),
//                     SizedBox(width: 18),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.5,
//                           child: Text(
//                             favourite["title"],
//                             // overflow: TextOverflow.ellipsis,
//                             maxLines: 1,
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Container(
//                             width: MediaQuery.of(context).size.width * 0.5,
//                             // color: Colors.amber,
//                             child: Text(
//                               favourite['artist'] ?? "Unknown",
//                               maxLines: 1,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 16,
//                                   color: Colors.black),
//                             )),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               favouriteController.deleteData(index);
//                               setState(() {});
//                             },
//                             icon: Icon(Icons.delete_outlined)),
//                       ],
//                     )

//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) => SizedBox(height: 10),
//         itemCount: favouriteController.myBox.length);
//   }
// }

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Banjo/core/constants/color.dart';
import 'package:Banjo/presentation/favourite_page/controller/favourites_controller.dart';
import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:Banjo/presentation/home_page/view/song_page.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  FavouriteController favouriteController = Get.put(FavouriteController());
  SongPlayerController songPlayerController = Get.put(SongPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackColorLogo1,
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          var favourite = favouriteController.myBox.getAt(index);
          return InkWell(
            onTap: () {
              //songPlayerController.playSongFromFavourites(favourite);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SongPageScreen(
                    songData: favourite,
                  ),
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorConstants.containerOrange,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            favourite["title"] ?? "",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            favourite['artist'] ?? "",
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Delay the state change to avoid setState during build exception

                            favouriteController.deleteData(index);

                            setState(() {});
                          },
                          icon: Icon(Icons.delete_outlined),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: favouriteController.myBox.length,
      ),
    );
  }
}
