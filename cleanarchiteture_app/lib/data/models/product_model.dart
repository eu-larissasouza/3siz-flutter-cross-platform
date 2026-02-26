// É o nosso DTO
// Faz a comunicação da entidade de forma que a API entenda
import 'package:arquitetura_app/domain/entity/product_entity.dart';

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