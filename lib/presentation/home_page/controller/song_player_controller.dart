// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:hive/hive.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:Banjo/presentation/favourite_page/controller/favourites_controller.dart';
// import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class SongPlayerController extends GetxController {
//   final player = AudioPlayer();
//   RxBool isPlaying = false.obs;
//   RxDouble sliderValue = 0.0.obs;
//   RxDouble sliderMaxValue = 0.0.obs;
//   RxString songTitle = "".obs;
//   RxString songArtist = "".obs;
//   RxBool isRepeat = false.obs;
//   //RxBool isShuffled = false.obs;
//   RxBool isFav = false.obs;
//   RxString totalTime = "0".obs;
//   RxString currentTime = "0".obs;
//   RxBool isSongLoaded = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     player.playerStateStream.listen((state) {
//       if (state.processingState == ProcessingState.completed) {
//         SongDataController songDataController = Get.find<SongDataController>();
//         songDataController.nextSongPlay();
//       }
//     });
//   }

//   Future<void> playLocalAudio(SongModel song) async {
//     songTitle.value = song.title;
//     songArtist.value = song.artist!;
//     await player.setAudioSource(AudioSource.uri(Uri.parse(song.data)));
//     player.play();
//     timePosition();
//     isPlaying.value = true;
//     isSongLoaded.value = true;
//   }

//   Future<void> repeatSong() async {
//     if (isRepeat.value) {
//       await player.setLoopMode(LoopMode.off);
//     } else {
//       await player.setLoopMode(LoopMode.one);
//     }

//     isRepeat.value = !isRepeat.value;
//   }

//   // Future<void> shuffledSong() async {
//   //   if (isShuffled.value) {
//   //     await player.setShuffleModeEnabled(false);
//   //   } else {
//   //     await player.setShuffleModeEnabled(true);
//   //   }
//   //   isShuffled.value = !isShuffled.value;
//   // }

//   Future<void> resumePlaying() async {
//     isPlaying.value = true;
//     await player.play();
//   }

//   Future<void> pausePlaying() async {
//     isPlaying.value = false;
//     await player.pause();
//   }

//   void timePosition() async {
//     try {
//       player.durationStream.listen((event1) {
//         totalTime.value = event1.toString().split(".")[0];
//         sliderMaxValue.value = event1!.inSeconds.toDouble();
//       });
//       player.positionStream.listen((event2) {
//         currentTime.value = event2.toString().split(".")[0];
//         sliderValue.value = event2.inSeconds.toDouble();
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   void sliderChange(Duration position) {
//     player.seek(position);
//   }

//   void stopPlaying() async {
//     await player.stop();
//     isPlaying.value = false;
//     isSongLoaded.value = false;
//   }

//   // // Future<void> playSongFromFavourites(Map favourite) async {
//   // //   songTitle.value = favourite["title"];
//   // //   songArtist.value = favourite["artist"] ?? "Unknown";
//   // //   try {
//   // //     await player
//   // //         .setAudioSource(AudioSource.uri(Uri.parse(favourite["data"])));
//   // //     await player.play();
//   // //     isPlaying.value = true;
//   // //   } catch (e) {
//   // //     print("Error playing song: $e");
//   // //     isPlaying.value = false;
//   // //   }
//   // }
// }

//new working code

// import 'package:Banjo/presentation/home_page/controller/song_data_controller.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class SongPlayerController extends GetxController {
//   final player = AudioPlayer();
//   RxBool isPlaying = false.obs;
//   RxDouble sliderValue = 0.0.obs;
//   RxDouble sliderMaxValue = 0.0.obs;
//   RxString songTitle = "".obs;
//   RxString songArtist = "".obs;
//   RxBool isRepeat = false.obs;
//   RxBool isFav = false.obs;
//   RxString totalTime = "0".obs;
//   RxString currentTime = "0".obs;
//   RxBool isSongLoaded = false.obs;
//   Rx<SongModel?> currentSongDetails = Rx<SongModel?>(null);

//   @override
//   void onInit() {
//     super.onInit();
//     player.playerStateStream.listen((state) {
//       if (state.processingState == ProcessingState.completed) {
//         SongDataController songDataController = Get.find<SongDataController>();
//         songDataController.nextSongPlay();
//       }
//     });
//   }

//   Future<void> playLocalAudio(SongModel song) async {
//     currentSongDetails.value = song;
//     songTitle.value = song.title;
//     songArtist.value = song.artist!;
//     await player.setAudioSource(AudioSource.uri(Uri.parse(song.data)));
//     player.play();
//     timePosition();
//     isPlaying.value = true;
//     isSongLoaded.value = true;
//   }

//   Future<void> repeatSong() async {
//     if (isRepeat.value) {
//       await player.setLoopMode(LoopMode.off);
//     } else {
//       await player.setLoopMode(LoopMode.one);
//     }
//     isRepeat.value = !isRepeat.value;
//   }

//   Future<void> resumePlaying() async {
//     isPlaying.value = true;
//     await player.play();
//   }

//   Future<void> pausePlaying() async {
//     isPlaying.value = false;
//     await player.pause();
//   }

//   void timePosition() async {
//     try {
//       player.durationStream.listen((event1) {
//         totalTime.value = event1.toString().split(".")[0];
//         sliderMaxValue.value = event1!.inSeconds.toDouble();
//       });
//       player.positionStream.listen((event2) {
//         currentTime.value = event2.toString().split(".")[0];
//         sliderValue.value = event2.inSeconds.toDouble();
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   void sliderChange(Duration position) {
//     player.seek(position);
//   }

//   Future<void> stopPlaying() async {
//     await player.stop();
//     isPlaying.value = false;
//     isSongLoaded.value = false;
//   }
// }

import 'package:banjo/presentation/home_page/controller/song_data_controller.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString imgUrl = "".obs;
  RxString songArtist = "".obs;
  RxBool isRepeat = false.obs;
  RxBool isFav = false.obs;
  RxString totalTime = "0".obs;
  RxString currentTime = "0".obs;
  RxBool isSongLoaded = false.obs;
  RxList<SongModel> recentlyPlayedSongs = <SongModel>[].obs;
  Rx<SongModel?> currentSongDetails = Rx<SongModel?>(null);

  @override
  void onInit() {
    super.onInit();
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        SongDataController songDataController = Get.find<SongDataController>();
        songDataController.nextSongPlay();
      }
    });
  }

  Future<void> playLocalAudio(SongModel song) async {
    currentSongDetails.value = song;
    songTitle.value = song.title;
    songArtist.value = song.artist!;
    await player.setAudioSource(AudioSource.uri(Uri.parse(song.data)));
    player.play();
    timePosition();
    isPlaying.value = true;
    isSongLoaded.value = true;

    // Add the song to the recently played list
    // recentlyPlayedSongs.add(song);
    // // Keep the list to a fixed size if necessary
    // if (recentlyPlayedSongs.length > 10) {
    //   recentlyPlayedSongs.removeAt(0);
    // }
  }

  Future<void> repeatSong() async {
    if (isRepeat.value) {
      await player.setLoopMode(LoopMode.off);
    } else {
      await player.setLoopMode(LoopMode.one);
    }
    isRepeat.value = !isRepeat.value;
  }

  Future<void> resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  Future<void> pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

  void timePosition() async {
    try {
      player.durationStream.listen((event1) {
        totalTime.value = event1.toString().split(".")[0];
        sliderMaxValue.value = event1!.inSeconds.toDouble();
      });
      player.positionStream.listen((event2) {
        currentTime.value = event2.toString().split(".")[0];
        sliderValue.value = event2.inSeconds.toDouble();
      });
    } catch (e) {
      print(e);
    }
  }

  void sliderChange(Duration position) {
    player.seek(position);
  }

  Future<void> stopPlaying() async {
    await player.stop();
    isPlaying.value = false;
    isSongLoaded.value = false;
  }

  Future<void> playSongFromFavourites(Map favourite) async {
    songTitle.value = favourite["title"] ?? "";
    songArtist.value = favourite["artist"] ?? "Unknown";
    imgUrl.value = favourite["id"];

    try {
      String audioUrl = favourite["data"] ?? "";
      await player.setUrl(audioUrl);
      await player.play();
      isPlaying.value = true;
      // await player
      //     .setAudioSource(AudioSource.uri(Uri.parse(favourite["data"])));
      // await player.play();
      // isPlaying.value = true;
    } catch (e) {
      print("Error playing song: $e");
      isPlaying.value = false;
    }
  }
}
