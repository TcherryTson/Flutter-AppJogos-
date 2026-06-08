class Favorito {
  int? id;
  int gameId;
  String title;
  String thumbnail;

  Favorito(this.gameId, this.title, this.thumbnail);

  Favorito.fromMap(Map map)
    : id = map["id"],
      gameId = map["gameId"],
      title = map["title"],
      thumbnail = map["thumbnail"];

  Map<String, dynamic> toMap() {
    return {"id": id, "gameId": gameId, "title": title, "thumbnail": thumbnail};
  }
}
