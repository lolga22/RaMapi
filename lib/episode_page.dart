import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EpisodePage extends StatefulWidget {
  @override
  _EpisodePageState createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  String _episodeName = '';
  String _episodeImage = '';

  Future<void> _fetchRandomEpisode() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/episode/${_generateRandomNumber(41)}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _episodeName = jsonData['name'];
        _episodeImage = 'https://rickandmortyapi.com/api/character/avatar/${_generateRandomNumber(671)}.jpeg';
      });
    } else {
      throw Exception('Ошибка загрузки эпизода');
    }
  }

  int _generateRandomNumber(int max) => 1 + DateTime.now().microsecondsSinceEpoch % max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Рандомный эпизод')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_episodeName.isNotEmpty) ...[
              Image.network(_episodeImage),
              SizedBox(height: 20),
              Text(
                'Название эпизода:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                _episodeName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchRandomEpisode,
              child: Text('Показать эпизод'),
            ),
          ],
        ),
      ),
    );
  }
}