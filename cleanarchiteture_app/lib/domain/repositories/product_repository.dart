
// Nessa arquitetura, nosso "service" existe em duas partes como um repository... 
// - Na camada de domain, o Repository é um contrato, uma abstração
// - Na camada de data, o Repository interage com o datasource

import 'package:arquitetura_app/domain/entities/product_entity.dart';

// Contrato entre a camada de domain e a camada de data
abstract class ProductRepository {

  Future<List<ProductEntity>> getProducts();
  Future<bool> createProduct(ProductEntity product);
}
