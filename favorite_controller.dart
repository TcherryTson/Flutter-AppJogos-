import 'package:get/get.dart';

import '../models/favorito.dart';
import '../persistence/favorito_helper.dart';

class FavoriteController extends GetxController {
  final FavoritoHelper _helper = FavoritoHelper();

  final favoritos = <Favorito>[].obs;

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();

    carregarFavoritos();
  }

  Future<void> carregarFavoritos() async {
    loading.value = true;

    favoritos.value = await _helper.getAll();

    loading.value = false;
  }

  Future<void> adicionar(Favorito favorito) async {
    await _helper.saveFavorito(favorito);

    await carregarFavoritos();
  }

  Future<void> remover(int id) async {
    await _helper.deleteFavorito(id);

    await carregarFavoritos();
  }

  bool existe(int gameId) {
    return favoritos.any((f) => f.gameId == gameId);
  }
}
