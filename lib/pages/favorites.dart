import 'package:flutter/material.dart';
import 'package:marvel_pedia/models/freegames_model.dart';
import 'package:marvel_pedia/pages/detail.dart';

import '../localstorage/db.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FreeGamesModel>>(
      future: DB.favoritesgames(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue, // Color del borde
                          width: 2.0, // Ancho del borde
                        ),
                      ),
                    ),
                    child: const Text(
                      'Favorites Games',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                FavoriteList(
                  favgames: snapshot.data,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class FavoriteList extends StatefulWidget {
  final List<FreeGamesModel> favgames;

  const FavoriteList({
    super.key,
    required this.favgames,
  });

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.favgames.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detail(list: widget.favgames[index]))),
          child: ListTile(
            leading: SizedBox(
                width: 60.0,
                child: Image(
                  image: NetworkImage(widget.favgames[index].thumbnail),
                  fit: BoxFit.cover,
                )),
            title: Text(widget.favgames[index].title),
            subtitle: Text(widget.favgames[index].genre),
            trailing: OutlinedButton(
              onPressed: () {
                setState(() {
                    DB.delete(widget.favgames[index]);
                widget.favgames.removeAt(index);
                });
              },
              child: const Icon(Icons.delete_forever),
            ),
          ),
        );
      },
    );
  }
}
