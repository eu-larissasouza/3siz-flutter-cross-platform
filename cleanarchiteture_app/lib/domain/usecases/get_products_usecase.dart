import 'package:arquitetura_app/data/repositories/product_repository_impl.dart';
import 'package:arquitetura_app/domain/entities/product_entity.dart';

// UseCase costuma começar o verbo HTTP


// O UseCase é o "coração" da sua regra de negócio.
// Não sabe de onde vêm os dados e nem como eles serão exibidos. 
// Ele foca apenas no o que o sistema deve fazer.
class GetProductsUsecase {
  final ProductRepositoryImpl repository;

  GetProductsUsecase(this.repository);

  // O método 'execute' facilita a execução na Controller
  Future<List<ProductEntity>> execute() async {
    // 1. Você pode adicionar validações aqui
    final products = await repository.getProducts();

    // 2. Exemplo de lógica de negócio:
    if (products.isEmpty) {
      // O UseCase cuida APENAS de validações lógicas

      // Validações técnicas, como status code 404, erro de JSON 
      // devem ser tratadas no Repository ou no Datasource.


      // Você pode lançar uma Exception customizada ou retornar um erro
      throw Exception("Nenhum produto encontrado no estoque.");
    }

    // 3. Retorna os dados prontos para a camada de Presentation
    return products;
  }
}
