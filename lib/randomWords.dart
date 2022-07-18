
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';
import 'package:restart_app/restart_app.dart';

class RandomPair extends StatefulWidget {
  RandomPair({Key? key}) : super(key: key);

  @override
  State<RandomPair> createState() => _RandomPairState();
}

class _RandomPairState extends State<RandomPair> {
  final randomWordPairs = <WordPair>[];
  final savedWordPairs = Set<WordPair>();
  String randomiser() {
    return Random().nextInt(100).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username Generator'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  final Iterable<ListTile> tiles = savedWordPairs.map(
                    (WordPair pair) {
                      return ListTile(
                        title: Text(
                          pair.asPascalCase,
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  );

                  final List<Widget> divided =
                      ListTile.divideTiles(context: context, tiles: tiles)
                          .toList();

                  return Scaffold(
                    appBar: AppBar(title: Text('Favorites'),),
                    body: ListView(children: divided)
                  );
                }),
              );
            },
            icon: const Icon(Icons.list_rounded),
          )
        ],
      ),
      body: buildList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restart_alt),
        backgroundColor: Colors.deepPurple.shade900,
        foregroundColor: Colors.white,
        onPressed:() => {Restart.restartApp()},
    )
    );
  }

  Widget buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(9),
      itemBuilder: (BuildContext context, int item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= randomWordPairs.length) {
          randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return buildRow(randomWordPairs[index]);
      },
    );
  }

  Widget buildRow(WordPair pair) {
    final alreadySaved = savedWordPairs.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase + randomiser(),
        style: const TextStyle(fontSize: 16),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_outline,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            savedWordPairs.remove(pair);
          } else {
            savedWordPairs.add(pair);
          }
        });
      },
    );
  }
}

class savedPage extends StatelessWidget {
  const savedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
    );
  }
}
