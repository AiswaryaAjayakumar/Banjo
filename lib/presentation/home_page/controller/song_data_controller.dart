// // ignore_for_file: avoid_print, invalid_use_of_protected_member, avoid_function_literals_in_foreach_calls, unnecessary_import

// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:Banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';

// class SongDataController extends GetxController {
//   SongPlayerController songPlayerController = Get.put(SongPlayerController());

//   final audioQuery = OnAudioQuery();

//   RxList<SongModel> songList = <SongModel>[].obs;
//   RxBool isDeviceSongs = false.obs;
//   RxInt currentSongIndex = 0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     storagePermission();
//   }

//   void getLocalSongs() async {
//     songList.value = await audioQuery.querySongs(
//         ignoreCase: true,
//         orderType: OrderType.ASC_OR_SMALLER,
//         sortType: null,
//         uriType: UriType.EXTERNAL);
//     isDeviceSongs.value = songList.isNotEmpty;
//   }

//   Future<void> storagePermission() async {
//     try {
//       var permission = await Permission.storage.request();
//       if (permission.isGranted) {
//         print("permission granted");
//         getLocalSongs();
//       } else {
//         print("permission denied");
//         Permission.storage.request();
//       }
//     } catch (exception) {
//       print(exception);
//     }
//   }

//   void currentIndex(int songId) {
//     var index = 0;
//     songList.forEach((element) {
//       if (element.id == songId) {
//         currentSongIndex.value = index;
//       }
//       index++;
//     });
//   }

//   void nextSongPlay() {
//     if (currentSongIndex.value < songList.length - 1) {
//       currentSongIndex.value++;
//       SongModel next = songList[currentSongIndex.value];
//       songPlayerController.playLocalAudio(next);
//     }
//   }

//   void previousSongPlay() {
//     if (currentSongIndex.value > 0) {
//       currentSongIndex.value--;
//       SongModel previous = songList[currentSongIndex.value];
//       songPlayerController.playLocalAudio(previous);
//     }
//   }
// }

// ignore_for_file: avoid_print, invalid_use_of_protected_member, avoid_function_literals_in_foreach_calls, unnecessary_import

// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:banjo/presentation/home_page/controller/song_player_controller.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';

// class SongDataController extends GetxController {
//   SongPlayerController songPlayerController = Get.put(SongPlayerController());

//   final audioQuery = OnAudioQuery();

//   RxList<SongModel> songList = <SongModel>[].obs;
//   RxBool isDeviceSongs = false.obs;
//   RxInt currentSongIndex = 0.obs;
//   RxString searchQuery = ''.obs;
//   RxList<SongModel> filteredSongs = <SongModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     storagePermission();
//   }

//   void getLocalSongs() async {
//     songList.value = await audioQuery.querySongs(
//       ignoreCase: true,
//       orderType: OrderType.ASC_OR_SMALLER,
//       sortType: null,
//       uriType: UriType.EXTERNAL,
//     );
//     isDeviceSongs.value = songList.isNotEmpty;
//     filteredSongs.assignAll(songList); // Initialize filteredSongs with all songs
//   }

//   Future<void> storagePermission() async {
//     try {
//       var permission = await Permission.storage.request();
//       if (permission.isGranted) {
//         print("Permission granted");
//         getLocalSongs();
//       } else {
//         print("Permission denied");
//         Permission.storage.request();
//       }
//     } catch (exception) {
//       print(exception);
//     }
//   }

//   void currentIndex(int songId) {
//     var index = 0;
//     songList.forEach((element) {
//       if (element.id == songId) {
//         currentSongIndex.value = index;
//       }
//       index++;
//     });
//   }

//   void nextSongPlay() {
//     if (currentSongIndex.value < filteredSongs.length - 1) {
//       currentSongIndex.value++;
//       SongModel next = filteredSongs[currentSongIndex.value];
//       songPlayerController.playLocalAudio(next);
//     }
//   }

//   void previousSongPlay() {
//     if (currentSongIndex.value > 0) {
//       currentSongIndex.value--;
//       SongModel previous = filteredSongs[currentSongIndex.value];
//       songPlayerController.playLocalAudio(previous);
//     }
//   }

//   void setSearchQuery(String query) {
//     searchQuery.value = query.toLowerCase();
//     filterSongs();
//   }

//   void filterSongs() {
//     if (searchQuery.isEmpty) {
//       filteredSongs.assignAll(songList);
//     } else {
//       List<SongModel> tempList = [];
//       songList.forEach((song) {
//         if (song.title.toLowerCase().contains(searchQuery.value) ||
//             song.artist!.toLowerCase().contains(searchQuery.value)) {
//           tempList.add(song);
//         }
//       });
//       filteredSongs.assignAll(tempList);
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:banjo/presentation/home_page/controller/song_player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongDataController extends GetxController {
  final SongPlayerController songPlayerController = Get.put(SongPlayerController());
  final OnAudioQuery audioQuery = OnAudioQuery();

  RxList<SongModel> songList = <SongModel>[].obs;
  RxBool isDeviceSongs = false.obs;
  RxInt currentSongIndex = 0.obs;
  RxString searchQuery = ''.obs;
  RxList<SongModel> filteredSongs = <SongModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted &&
        await Permission.mediaLibrary.request().isGranted) {
      print("Permissions granted");
      getLocalSongs();
    } else {
      print("Permissions denied");
      await Permission.storage.request();
      await Permission.mediaLibrary.request();
      if (await Permission.storage.isGranted &&
          await Permission.mediaLibrary.isGranted) {
        getLocalSongs();
      }
    }

    // Android 13+ permissions
    if (await Permission.audio.request().isGranted &&
        await Permission.mediaLibrary.request().isGranted) {
      print("Media permissions granted");
      getLocalSongs();
    } else {
      print("Media permissions denied");
      await Permission.audio.request();
      await Permission.mediaLibrary.request();
      if (await Permission.audio.isGranted &&
          await Permission.mediaLibrary.isGranted) {
        getLocalSongs();
      }
    }
  }

  void getLocalSongs() async {
    try {
      List<SongModel> songs = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
      );
      songList.value = songs;
      isDeviceSongs.value = songList.isNotEmpty;
      filteredSongs.assignAll(songList); // Initialize filteredSongs with all songs
    } catch (e) {
      print("Error fetching songs: $e");
    }
  }

  void currentIndex(int songId) {
    var index = 0;
    songList.forEach((element) {
      if (element.id == songId) {
        currentSongIndex.value = index;
      }
      index++;
    });
  }

  void nextSongPlay() {
    if (currentSongIndex.value < filteredSongs.length - 1) {
      currentSongIndex.value++;
      SongModel next = filteredSongs[currentSongIndex.value];
      songPlayerController.playLocalAudio(next);
    }
  }

  void previousSongPlay() {
    if (currentSongIndex.value > 0) {
      currentSongIndex.value--;
      SongModel previous = filteredSongs[currentSongIndex.value];
      songPlayerController.playLocalAudio(previous);
    }
  }

  void setSearchQuery(String query) {
    searchQuery.value = query.toLowerCase();
    filterSongs();
  }

  void filterSongs() {
    if (searchQuery.isEmpty) {
      filteredSongs.assignAll(songList);
    } else {
      List<SongModel> tempList = [];
      songList.forEach((song) {
        if (song.title.toLowerCase().contains(searchQuery.value) ||
            song.artist!.toLowerCase().contains(searchQuery.value)) {
          tempList.add(song);
        }
      });
      filteredSongs.assignAll(tempList);
    }
  }
}
