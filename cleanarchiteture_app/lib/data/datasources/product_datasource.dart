// DataSource é quem vai comunicar com a nossa API, nossa camada de saida do aplicativo
import 'package:arquitetura_app/core/custom_http_client.dart';
import 'package:arquitetura_app/data/models/product_model.dart';
import 'package:arquitetura_app/domain/entities/product_entity.dart';

class ProductDatasource {
  // Sempre que há um atributo final, deve ser um parâmetro do construtor da classe
  final CustomHttpClient httpClient;

  ProductDatasource(this.httpClient);

  // Promessa de que no futuro vai receber uma lista de produtos
  Future<List<ProductEntity>> getProducts() async {
    // a minha response é um map de chave-valor
    final response = await httpClient.getProducts();

    // transformo uma lista de maps em uma lista
    // cada elemento da nossa lista dynamic vai ser transformado em um model e depois em produto
    final List<dynamic> dataList = response.data is List ? response.data : [];

    return dataList
        .map((e) => ProductModel.fromJson(e))
        .map((model) => model.toProductEntity())
        .toList();
  }

  // Método para cadastrar um produto
  // Recebo apenas um boolean se cadastrou ou não
  // ------> Isso acontece, porque já temos a informação do produto

  // Parâmetro é um Product que conhecemos no projeto
  Future<bool> createProduct(ProductEntity product) async {
    // Antes de chamar o client, fazer a proteção para possiveis erros na API
    try {
      final model = ProductModel.fromProductEntity(product);
      httpClient.createProduct(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
