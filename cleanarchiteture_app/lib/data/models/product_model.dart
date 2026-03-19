// É o nosso DTO
// Faz a comunicação da entidade de forma que a API entenda
import 'package:arquitetura_app/domain/entities/product_entity.dart';

// Entity é a unidade de negócio, Model é a camada de dados
//
//
// UPDATE: 18/03/2026
// Em Clean Architeture devemos evitar o forte acoplamento, e
// com a herança, se o ProductEntity mudar, o ProductModel deve mudar também
// -> Vamos remover a herança
class ProductModel {
  final int id;
  final String title;
  final String price;

  ProductModel({required this.id, required this.title, required this.price});

  // Pra transformar o JSON em um DTO, temos uma factory
  // Lemos o valor JSON e transformamos em ProductModel.

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // Cria um ProductModel a partir de um mapa JSON
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
    );
  }

  // Transforma em um mapa conhecido pela API
  Map<String, dynamic> toJson() {
    return {'id': this.id, 'title': this.title, 'price': this.price};
  }

  // factory é um tipo de classe que consegue fabricar
  // um novo objeto atraves dos parametros que já tenho
  factory ProductModel.fromProductEntity(ProductEntity productEntity) {
    // Transforma em model para usar na API
    return ProductModel(
      id: productEntity.id,
      title: productEntity.title,
      price: productEntity.price,
    );
  }

  ProductEntity toProductEntity() {
    // Transforma em entity para usar no sistema
    return ProductEntity(id: this.id, title: this.title, price: this.price);
  }
}
