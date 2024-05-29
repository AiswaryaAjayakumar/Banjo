import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;

  Future<void> playLocalAudio(String url) async {
    await player.setAudioSource(AudioSource.uri(Uri.parse(url)));
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
