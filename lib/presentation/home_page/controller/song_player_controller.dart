import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxDouble sliderValue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;

  Future<void> playLocalAudio(SongModel song) async {
    songTitle.value = song.title;
    songArtist.value = song.artist!;
    await player.setAudioSource(AudioSource.uri(Uri.parse(song.data)));
    player.play();
    isPlaying.value = true;
  }

  Future<void> resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  Future<void> pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }
}
