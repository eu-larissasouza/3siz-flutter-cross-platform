import 'package:dio/dio.dart';

// Arquivo responsável por gerenciar as requisições de rede
class CustomHttpClient {
  // Biblioteca que faz comunicação com a API
  final Dio dio;

  CustomHttpClient(): dio = Dio();

  // Método que consome uma API
  // Como não é uma API síncrona, usamos Future, porque depende de rede, latência, etc
  
  Future<Response> getProducts() async{ 
    // Aguarda a resposta e quando recebe, ele retorna
    return await dio.get("https://gdapp.com.br/api/fiap/products");
  }
}