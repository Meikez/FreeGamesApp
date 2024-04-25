class FreeGamesModel {
  final int id;
  final String title;
  final String thumbnail;
  final String short_description;
  final String game_url;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String release_date;
  final String freetogame_profile_url;

  FreeGamesModel(
      {required this.id,
      required this.title,
      required this.thumbnail,
      required this.short_description,
      required this.game_url,
      required this.genre,
      required this.platform,
      required this.publisher,
      required this.developer,
      required this.release_date,
      required this.freetogame_profile_url});

  factory FreeGamesModel.fromJsonMap(Map<String, dynamic> json) =>
      FreeGamesModel(
          id: json["id"],
          title: json["title"],
          thumbnail: json["thumbnail"],
          short_description: json["short_description"],
          game_url: json["game_url"],
          genre: json["genre"],
          platform: json["platform"],
          publisher: json["publisher"],
          developer: json["developer"],
          release_date: json["release_date"],
          freetogame_profile_url: json["freetogame_profile_url"]);

  FreeGamesModel apiInstance(Map<String, dynamic> data) {
    return FreeGamesModel(
        id: data["id"],
        title: data["title"],
        thumbnail: data["thumbnail"],
        short_description: data["short_description"],
        game_url: data["game_url"],
        genre: data["genre"],
        platform: data["platform"],
        publisher: data["publisher"],
        developer: data["developer"],
        release_date: data["release_date"],
        freetogame_profile_url: data["freetogame_profile_url"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'short_description': short_description,
      'game_url':game_url,
      'genre':genre,
      'platform':platform,
      'publisher':publisher,
      'developer':developer,
      'release_date':release_date,
      'freetogame_profile_url':freetogame_profile_url

    };
  }
}
