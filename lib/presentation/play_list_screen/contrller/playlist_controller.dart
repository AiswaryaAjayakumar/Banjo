// // ignore_for_file: avoid_print

// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:flutter/material.dart';

// class PlaylistController extends GetxController {
//   static TextEditingController titleController = TextEditingController();
//   var playlists = <String>[].obs;
//   var myBox = Hive.box('playlist');
//   static List playlistKeys = [];

//   @override
//   void onInit() {
//     super.onInit();
//     fetchData();
//   }

//    void fetchData() {
//     playlistKeys = myBox.keys.toList();
//     print("Playlist keys: $playlistKeys");
//     playlists.value = playlistKeys.map((key) {
//       var value = myBox.get(key);
//       print("Fetched value: $value");
//       return value['title'] ?? 'Unknown Title';
//     }).toList().cast<String>(); // Convert to list and cast to List<String>
//     print("Playlists: ${playlists.value}");
//   }

//   void addData() {
//     myBox.add({"title": titleController.text});
//     fetchData();
//   }

//   void deleteData(var key) {
//     myBox.delete(key);
//     fetchData();
//   }

//   void clearController() {
//     titleController.clear();
//   }
// }

import 'package:banjo/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PlaylistController extends GetxController {
  static TextEditingController titleController = TextEditingController();
  var playlists = <String>[].obs;
  var myBox = Hive.box('playlist');
  static List<dynamic> playlistKeys = [];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    playlistKeys = myBox.keys.toList();
    print("Playlist keys: $playlistKeys");
    playlists.value = playlistKeys
        .map((key) {
          var value = myBox.get(key);
          print("Fetched value: $value");
          return value['title'] ?? 'Unknown Title';
        })
        .toList()
        .cast<String>(); // Convert to list and cast to List<String>
    // print("Playlists: ${playlists.value}");
  }

  void addData(BuildContext context) {
    String newTitle = titleController.text;
    if (playlists.contains(newTitle)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorConstants.copperColorLogo1,
          content: Text('Playlist with the same name already exists!'),
        ),
      );
      return;
    }

    print("Adding data: $newTitle");
    myBox.add({"title": newTitle});
    fetchData();
  }

   void deletePlaylist(int index) {
    var key = playlistKeys[index];
    print("Deleting key: $key");
    myBox.delete(key);
    fetchData();
  }

  void clearController() {
    titleController.clear();
  }
}
