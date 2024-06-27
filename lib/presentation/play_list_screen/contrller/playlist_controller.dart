import 'package:get/get.dart';

class PlaylistController extends GetxController {
  var playlists = <String>[].obs;

  void addPlaylist(String name) {
    playlists.add(name);
  }
}
