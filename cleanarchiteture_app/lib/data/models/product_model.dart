// É o nosso DTO
// Faz a comunicação da entidade de forma que a API entenda
import 'package:arquitetura_app/domain/entities/product_entity.dart';

// Entity é a unidade de negócio, Model é a camada de dados
class ProductModel extends ProductEntity{
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
  });

  // Pra transformar o JSON em um DTO, temos uma factory
  // Lemos o valor JSON e transformamos em ProductModel.
  factory ProductModel.fromJson(Map<String, dynamic>json){
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"]
    );
  }
}