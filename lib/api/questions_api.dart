import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchQuestions(String category, String difficulty) async {
  const String apiKey = 'j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa';

  String url =
      'https://quizapi.io/api/v1/questions?apiKey=$apiKey&category=$category&difficulty=$difficulty&limit=10';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw const HttpException('Failed to load');
  }
}
