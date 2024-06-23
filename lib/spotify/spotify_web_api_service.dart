import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract mixin class SpotifyWebApiService {
  final String clientId = dotenv.env['CLIENT_ID'] ?? '';
  final String clientSecret = dotenv.env['CLIENT_SECRET'] ?? '';

  Future<String> getAccessToken() async {
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'grant_type': 'client_credentials'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['access_token'];
    } else {
      throw Exception('Failed to get access token');
    }
  }

  Future searchMusic(String query) async {
    final token = await getAccessToken();
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/search?q=$query&type=track'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List searchResult = [];

      for (var item in json['tracks']['items']) {
        final String trackImage = item['album']['images'][0]['url'];
        final String trackName = item['name'];
        final String artistsName = item['artists'][0]['name'];

        Map<dynamic, dynamic> trackInfo = {
          'trackImage': trackImage,
          'trackName': trackName,
          'artistsName': artistsName,
        };

        searchResult.add(trackInfo);
      }

      return searchResult;
    } else {
      throw Exception('Failed to search tracks');
    }
  }
}
