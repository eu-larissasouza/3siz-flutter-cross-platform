import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/product_entity.dart';
import '../controllers/product_controller.dart';

// Tela para cadastrar um novo produto
// Esta página exemplifica como criar um formulário simples em Flutter
// e como integrar com o controller para cadastrar um produto.
class ProductCreatePage extends StatefulWidget {
  const ProductCreatePage({super.key});

  @override
  State<ProductCreatePage> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  // Chave para validar o formulário
  final _formKey = GlobalKey<FormState>();
  // Controladores para os campos de texto
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    // Libera os recursos dos controladores ao fechar a tela
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submit() async {
    // Verifica se o formulário está válido
    if (_formKey.currentState!.validate()) {
      // Cria uma instância de ProductEntity com os dados do formulário
      final product = ProductEntity(
        id: 0, // O id pode ser gerado pelo backend
        title: _titleController.text,
        price: _priceController.text,
      );
      // Chama o método do controller para cadastrar o produto
      // await Provider.of<ProductController>(
      //   context,
      //   listen: false,
      // ).createProduct(product);
      // Retorna para a tela anterior após salvar
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold é a estrutura básica de uma tela em Flutter
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProductController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              // Mostra o CircularProgressIndicator enquanto está carregando
              return const Center(child: CircularProgressIndicator());
            }
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  // Campo para o título do produto
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Título'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Informe o título'
                        : null,
                  ),
                  // Campo para o preço do produto
                  TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: 'Preço'),
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Informe o preço'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  // Botão para salvar o produto
                  ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}