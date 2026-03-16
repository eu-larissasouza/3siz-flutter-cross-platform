import 'package:dio/dio.dart';

class CustomHttpClient {
  final Dio dio;

  CustomHttpClient() : dio = Dio();

  Future<Response> getCharacters() async {
    return await dio.get("https://hp-api.onrender.com/api/characters");
  }
}
