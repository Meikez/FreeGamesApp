import 'package:marvel_pedia/models/freegames_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'favgames.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE favgames (id INTEGER PRIMARY KEY, title TEXT, thumbnail TEXT, short_description TEXT, game_url TEXT, genre TEXT, platform TEXT, publisher TEXT, developer TEXT, release_date TEXT, freetogame_profile_url TEXT )");
    }, version: 1);
  }

  static Future<int> insert(Map<String, dynamic> freegames) async {
    Database database = await _openDB();
    return database.insert("favgames", freegames);
  }

  static Future<int> delete(FreeGamesModel freegames) async {
    Database database = await _openDB();

    return database
        .delete("favgames", where: "id = ?", whereArgs: [freegames.id]);
  }

//     static Future<int> update(Map<String, dynamic> freegames) async{
//     Database database = await _openDB();

//     return database.update("favgames", where:"id = ?", whereArgs: [freegames["id"]]);
//   }

  static Future<List<FreeGamesModel>> favoritesgames() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> favgames =
        await database.query("favgames");

    // return favgames;

    return List.generate(favgames.length,
      (index) => FreeGamesModel(
        id: favgames[index]['id'],
        title: favgames[index]['title'],
        thumbnail: favgames[index]['thumbnail'],
        short_description: favgames[index]['short_description'],
        game_url: favgames[index]['game_url'],
        genre: favgames[index]['genre'],
        platform: favgames[index]['platform'],
        publisher: favgames[index]['publisher'],
        developer: favgames[index]['developer'],
        release_date: favgames[index]['release_date'],
        freetogame_profile_url: favgames[index]['freetogame_profile_url']));
  }
}
