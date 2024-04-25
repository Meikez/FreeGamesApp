import 'package:flutter/material.dart';
import 'package:marvel_pedia/main.dart';
import 'package:marvel_pedia/pages/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../localstorage/db.dart';
import '../models/freegames_model.dart';
import '../widgets/category_list.dart';

class Detail extends StatefulWidget {
  final FreeGamesModel list;
  const Detail({super.key, required this.list});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage())),
                child: const Text(
                  "Go To Home",
                  style: TextStyle(fontSize: 18, color: Colors.purpleAccent),
                ),
              ),
              SizedBox(
                  height: 300,
                  child: Image(
                    image: NetworkImage(widget.list.thumbnail),
                    fit: BoxFit.cover,
                  )),
              Center(
                child: SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(widget.list.title,
                        style: const TextStyle(fontSize: 40)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DetailItem(
                    title: "Platform",
                    value: widget.list.platform,
                  ),
                  DetailItem(
                    title: "Genre",
                    value: widget.list.genre,
                  ),
                  DetailItem(
                    title: "Release Date",
                    value: widget.list.release_date,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color.fromARGB(255, 43, 31, 61),
                width: 350.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    widget.list.short_description,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        DB.insert(widget.list.toMap());
                        Fluttertoast.showToast(
                            msg: '¡Game added to favorites!',
                            toastLength: Toast.LENGTH_SHORT);
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: '¡Try again!',
                            toastLength: Toast.LENGTH_SHORT);
                      }

                      // showFavGames();
                    },
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 111, 61, 186)),
                    child: const Text('Add to favorites'),
                  ),
                ),
              ),
              ShowCategoryList(
                category: widget.list.genre,
                currentGame: widget.list.id,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyApp(
                        pageTo: value,
                      )));
        },
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorites")
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String title;
  final String value;

  const DetailItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(value)
      ],
    );
  }
}
