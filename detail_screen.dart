import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';
import '../models/favorito.dart';
import '../models/game.dart';

class DetailScreen extends StatelessWidget {
  final Game game;

  const DetailScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                game.thumbnail,
                height: 220,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.videogame_asset, size: 100);
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              game.title,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text('Gênero: ${game.genre}'),
            Text('Plataforma: ${game.platform}'),
            Text('Publisher: ${game.publisher}'),
            Text('Developer: ${game.developer}'),
            const SizedBox(height: 20),
            const Text(
              'Descrição',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(game.shortDescription),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await Get.find<FavoriteController>().adicionar(
                    Favorito(game.id, game.title, game.thumbnail),
                  );
                  Get.snackbar("Sucesso", "Jogo favoritado");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.favorite),
                label: const Text("Favoritar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
