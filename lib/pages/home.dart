import 'package:flutter/material.dart';
import 'package:marvel_pedia/models/freegames_model.dart';
import 'package:marvel_pedia/utils/extensions.dart';

import 'package:marvel_pedia/widgets/poster_card.dart';

import '../API/freegames_apicall.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final games = GetFreeGames();
    //final gamesList = games.getAnswer();

    //TOD: Color SafeArea
    return  FutureBuilder(
            future: games.getAnswer(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SafeArea(
                  child: HeadeHome(
                    games: snapshot.data,
                  ),
                );

                
              }
            });
            
            
  }
}

class HeadeHome extends StatelessWidget {
  final List<FreeGamesModel> games;

  const HeadeHome({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final List categories = [
      "mmorpg", 
      "shooter",
      "strategy",
      "moba",
      "racing",
      "sports",
      "social",
      "sandbox",
      "open-world",
      "survival",
      "pvp",
      "pve",
      "pixel",
      "voxel",
      "zombie",
      "turn-based",
      "first-person",
      "third-Person", 
      "top-down", "tank", 
      "space", 
      "sailing",
      "side-scroller", 
      "superhero",
      "permadeath", 
      "card", 
      "battle-royale", 
      "mmo", 
      "mmofps", 
      "mmotps", 
      "3d", 
      "2d", 
      "anime", 
      "fantasy", 
      "sci-fi", 
      "fighting",
      "action-rpg", 
      "action",
      "military", 
      "martial-arts", 
      "flight", 
      "low-spec",
      "tower-defense",
      "horror",
      "mmorts"
    ];
    //final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        
        children: [
      
          const SizedBox(
            height: 60,
            child: Center(
              child: Text('READY TO PLAY?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            child: Image.asset("assets/asus-rog.jpg"),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,        
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: index != 0
                      ? Text(
                          categories[index],
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              categories[index],
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Container(
                                  width: 5,
                                  height: 5,
                                ))
                          ],
                        ),
                );
              },
            ),
          ),
          PosterCard(games: games),
          60.pv,
          const Text('Todos los juegos gratuitos',
            style: TextStyle(
              fontSize: 20,
              fontWeight:FontWeight.bold,
            ),
          ),
          20.pv,
          _GameList(games: games,),
        ],
      ),
    );
  }
}

class _GameList extends StatelessWidget {
  final List<FreeGamesModel> games;

  const _GameList({
    super.key,
    required this.games,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      itemCount: games.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detail(list: games[index]))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: 400,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: NetworkImage(games[index].thumbnail),
                        image: NetworkImage(
                          games[index].thumbnail,
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 100,
                      width: 400,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black.withOpacity(0.8),
                              ],
                              stops: const [
                                0.0,
                                0.7
                              ])),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      games[index].title,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                         color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      ),
                                  ),
                                ],
                              ),
                              ),
                ),
              ],
            ),
          ),
        );

      },
    );
  }
}


  