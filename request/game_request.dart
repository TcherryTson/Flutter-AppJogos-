import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game.dart';

class GameRequest {
  Future<List<Game>> getGames() async {
    final response = await http.get(
      Uri.parse('https://www.freetogame.com/api/games'),
    );
    List<Game> games = List<Game>.empty(growable: true);
    if (response.statusCode == 200) {
      List resList = jsonDecode(response.body);
      for (final mGame in resList) {
        games.add(Game.fromJson(mGame));
      }
    }
    return games;
  }
}
