import 'package:flutter/material.dart';

import '../models/freegames_model.dart';
import '../pages/detail.dart';

class PosterCard extends StatelessWidget {
  final List<FreeGamesModel> games;
  final bool hideGame;
  final int? currentGame;
  const PosterCard({super.key, required this.games, this.hideGame = false,this.currentGame});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: games.length,
        itemBuilder: (BuildContext context, int index) {
          if (currentGame==games[index].id) {
            return Container();
          }
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detail(list: games[index]))),
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: DecorationImage(
                  image: NetworkImage(games[index].thumbnail),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.blue.withOpacity(0.9)
                      ],
                      stops: const [
                        0.1,
                        0.7
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      games[index].title,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      games[index].publisher,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
