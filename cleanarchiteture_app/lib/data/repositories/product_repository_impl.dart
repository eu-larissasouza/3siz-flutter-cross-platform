
// Representa o nosso service propriamente dito
import 'package:arquitetura_app/data/datasources/product_datasource.dart';
import 'package:arquitetura_app/domain/entities/product_entity.dart';
import 'package:arquitetura_app/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  final ProductDatasource productDatasource;

  ProductRepositoryImpl(this.productDatasource);

  @override
  Future<List<ProductEntity>> getProducts() {
   return productDatasource.getProducts(); 
  }
  
}