import 'package:get/get.dart';

import '../models/game.dart';
import '../request/game_request.dart';

class GameController extends GetxController {
  final games = <Game>[].obs;

  final loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadGames();
  }

  Future<void> loadGames() async {
    loading.value = true;

    games.value = await GameRequest().getGames();

    loading.value = false;
  }
}
