import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: Obx(() {
        if (controller.favoritos.isEmpty) {
          return const Center(child: Text('Nenhum jogo favoritado'));
        }
        return ListView.builder(
          itemCount: controller.favoritos.length,
          itemBuilder: (context, index) {
            final favorito = controller.favoritos[index];
            return ListTile(
              leading: Image.network(favorito.thumbnail, width: 60),
              title: Text(favorito.title),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await controller.remover(favorito.id!);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
