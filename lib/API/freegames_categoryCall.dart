import 'package:dio/dio.dart';
import 'package:marvel_pedia/models/freegames_model.dart';

class GetGamesByCategory {
  final _dio = Dio();
  final String category;

  GetGamesByCategory({required this.category});

  Future<List<FreeGamesModel>> getAnswer() async {
    final String url =
        "https://www.freetogame.com/api/games?category=$category";
        List<FreeGamesModel> freegames = [];
    try {
      final response = await _dio.get(url);
      // print(response.data);
      

      for (Map<String, dynamic> element in response.data) {
        FreeGamesModel myGame = FreeGamesModel.fromJsonMap(element);
        freegames.add(myGame);
      }

      return freegames;
    } catch (e) {
      print(e);
      return freegames= [];
    }
  }
}
