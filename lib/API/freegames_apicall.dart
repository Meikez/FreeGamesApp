import 'package:dio/dio.dart';
import 'package:marvel_pedia/models/freegames_model.dart';

class GetFreeGames {
  final _dio = Dio();

  Future<List<FreeGamesModel>> getAnswer() async {
    final response = await _dio.get("https://www.freetogame.com/api/games");
    // print(response.data);
    List<FreeGamesModel> freegames = [];

    for (Map<String, dynamic> element in response.data) {
      /*FreeGamesModel myGame = FreeGamesModel(
          id: element['id'],
          title: element['title'],
          thumbnail: element['thumbnail'],
          short_description: element['short_description'],
          game_url: element['game_url'],
          genre: element['genre'],
          platform: element['platform'],
          publisher: element['publisher'],
          developer: element['developer'],
          release_date: element['release_date'],
          freetogame_profile_url: element['freetogame_profile_url']);*/

      FreeGamesModel myGame = FreeGamesModel.fromJsonMap(element);
      freegames.add(myGame);
    }

    return freegames;
  }
}
