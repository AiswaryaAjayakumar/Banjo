import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;
  RxBool isRepeat = false.obs;
  RxString totalTime = "0".obs;
  RxString currentTime = "0".obs;

  Future<void> playLocalAudio(SongModel song) async {
    songTitle.value = song.title;
    songArtist.value = song.artist!;
    await player.setAudioSource(AudioSource.uri(Uri.parse(song.data)));
    player.play();
    timePosition();
    isPlaying.value = true;
  }

  // Future<void> repeatSong() async {
  //   if (isRepeat.value) {
  //     await player.setLoopMode(LoopMode.off);
  //   } else {
  //     await player.setLoopMode(LoopMode.one);
  //   }

  //   isRepeat.value = !isRepeat.value;
  // }

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
}
