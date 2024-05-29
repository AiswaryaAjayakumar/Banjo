
import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerController extends GetxController {
 
  final player = AudioPlayer();

    Future<void> playLocalAudio(String url) async {
   await player.setAudioSource(AudioSource.uri(Uri.parse(url)));
    player.play();
  }
  }

