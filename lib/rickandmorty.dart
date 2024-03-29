import 'package:flutter/material.dart';
import 'character_page.dart';
import 'episode_page.dart';

class RickAndMortyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick and Morty')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CharacterPage()),
                );
              },
              child: Text('Показать рандомного персонажа'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EpisodePage()),
                );
              },
              child: Text('Показать рандомный эпизод'),
            ),
          ],
        ),
      ),
    );
  }
}