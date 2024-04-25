

import 'package:flutter/material.dart';
import 'package:marvel_pedia/API/freegames_categoryCall.dart';
import 'package:marvel_pedia/widgets/poster_card.dart';
import '../models/freegames_model.dart';

class ShowCategoryList extends StatelessWidget {
  final String category;
  final int currentGame;

  const ShowCategoryList(
      {super.key, required this.category, required this.currentGame});

  @override
  Widget build(BuildContext context) {
    final games = GetGamesByCategory(category: category).getAnswer();

    return FutureBuilder(
        future: games,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data is List && snapshot.data.isEmpty) {
            return const SizedBox(
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.not_accessible_sharp),
                    Text('Games not founds')
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "More about the Genre",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PosterCard(
                    games: snapshot.data,
                    currentGame: currentGame,
                  ),
                ],
              ),
            );
          }
        });
  }
}

class ListByCategory extends StatelessWidget {
  final List<FreeGamesModel> games;
  const ListByCategory({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Padding(
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
                              ]))),
                ),
              ],
            ),
          );
        });
  }
}
