import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CharacterPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  String _characterName = '';
  String _characterImage = '';

  Future<void> _fetchRandomCharacter() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/${_generateRandomNumber(671)}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _characterName = jsonData['name'];
        _characterImage = jsonData['image'];
      });
    } else {
      throw Exception('Ошибка загрузки персонажа');
    }
  }

  int _generateRandomNumber(int max) => 1 + DateTime.now().microsecondsSinceEpoch % max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Рандомный песонаж')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_characterName.isNotEmpty) ...[
              Image.network(_characterImage),
              SizedBox(height: 20),
              Text(
                'Персонаж:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                _characterName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchRandomCharacter,
              child: Text('Показать рандомного персонажа'),
            ),
          ],
        ),
      ),
    );
  }
}