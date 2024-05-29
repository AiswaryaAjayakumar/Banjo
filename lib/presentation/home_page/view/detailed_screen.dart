// // ignore_for_file: prefer_const_constructors

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:music_app/presentation/home_page/view/widgets/custom_listed_songs.dart';

// class DetailedScreen extends StatefulWidget {
//   const DetailedScreen({super.key});

//   @override
//   State<DetailedScreen> createState() => _DetailedScreenState();
// }

// class _DetailedScreenState extends State<DetailedScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: <Widget>[
//         Image.network(
//           'https://images.pexels.com/photos/145707/pexels-photo-145707.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           fit: BoxFit.cover,
//         ),
//         Center(
//           child: ClipRect(
//             // Clip widget to contain the blur to one widget
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // The filter
//               child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade100.withOpacity(0.1)),
//                   child: CustomListedSongs()),
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }
