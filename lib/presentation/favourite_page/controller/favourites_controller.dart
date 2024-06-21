import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

// class FavoritesController extends GetxController {
//   var favoritesBox = Hive.box('fav');

//   List<SongModel> get favorites {
//     return favoritesBox.values.toList().cast<SongModel>();
//   }

//   void addFavorite(SongModel song) {
//     favoritesBox.put(song.id, song);
//   }

//   void removeFavorite(SongModel song) {
//     favoritesBox.delete(song.id);
//   }

//   bool isFavorite(SongModel song) {
//     return favoritesBox.containsKey(song.id);
//   }
// }
