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
    // cada elemento da nossa lista dynamic vai ser transformado em um produto
    return (response.data as List)
        .map((p) => ProductModel.fromJson(p))
        .toList();
  }
}
