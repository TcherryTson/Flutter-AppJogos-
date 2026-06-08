import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import '../models/game.dart';
import 'detail_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Get.to(() => const FavoritesScreen());
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.loadGames();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.games.isEmpty) {
          return const Center(child: Text('Nenhum jogo encontrado'));
        }
        return ListView.builder(
          itemCount: controller.games.length,
          itemBuilder: (context, index) {
            Game game = controller.games[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Image.network(
                  game.thumbnail,
                  width: 70,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.videogame_asset, size: 40);
                  },
                ),
                title: Text(game.title),
                subtitle: Text('${game.genre}\n${game.platform}'),
                isThreeLine: true,
                onTap: () {
                  Get.to(() => DetailScreen(game: game));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
