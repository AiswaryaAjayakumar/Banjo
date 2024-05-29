// ignore_for_file: avoid_print, invalid_use_of_protected_member

import 'package:get/state_manager.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongDataController extends GetxController {
  final audioQuery = OnAudioQuery();

  RxList<SongModel> songList = <SongModel>[].obs;
  RxBool isDeviceSongs = false.obs;

  @override
  void onInit() {
    super.onInit();
    storagePermission();
  }

  void getLocalSongs() async {
    songList.value = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL);
    print(songList.value);
  }

  Future<void> storagePermission() async {
    try {
      var permission = await Permission.storage.request();
      if (permission.isGranted) {
        print("permission granted");
        getLocalSongs();
      } else {
        print("permission denied");
        Permission.storage.request();
      }
    } catch (exception) {
      print(exception);
    }
  }
}
