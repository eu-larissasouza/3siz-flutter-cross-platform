import 'package:arquitetura_app/domain/entities/product_entity.dart';
import 'package:arquitetura_app/domain/usecases/get_products_usecase.dart';
import 'package:flutter/material.dart';

// Responsável por orquestrar as informações que a tela necessita para renderizar

class ProductController extends ChangeNotifier {
  // Injetamos o UseCase via construtor
  final GetProductsUsecase _getProductsUsecase;

  ProductController(this._getProductsUsecase);

  // Estados que a sua Page já espera:
  List<ProductEntity> _products = [];

  bool isLoading = false;
  String? error;

  // get estabelece que é um campo somente leitura
  // todo mundo pode ler esse campo, mas apenas o Controller altera
  List<ProductEntity> get products => _products;

  // Método chamado no initState da sua Page
  // Usamos void por não haver retorno, uma vez que nossa tela trabalha com estados
  // Ao invés de retornar, vamos notificar a tela quando houver mudança de estado
  Future<void> fetchProducts() async {
    isLoading = true;
    error = null;
    notifyListeners(); // Avisa a Page para mostrar o loading

    try {
      _products = await _getProductsUsecase.execute();
    } catch (e) {
      // Capturar erro do useCase
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners(); // Avisa a Page que o carregamento acabou (sucesso ou erro)
    }
  }
}