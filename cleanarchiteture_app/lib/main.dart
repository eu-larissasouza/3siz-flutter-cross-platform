import 'package:arquitetura_app/core/custom_http_client.dart';
import 'package:arquitetura_app/data/datasources/product_datasource.dart';
import 'package:arquitetura_app/data/repositories/product_repository_impl.dart';
import 'package:arquitetura_app/domain/usecases/get_products_usecase.dart';
import 'package:arquitetura_app/presentation/controllers/product_controller.dart';
import 'package:arquitetura_app/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _httpClient = CustomHttpClient();
    final _dataSource = ProductDatasource(_httpClient);
    final _repository = ProductRepositoryImpl(_dataSource);
    final _getProductUsecase = GetProductsUsecase(_repository);

    // Provider são todas as camadas que criamos
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductController(_getProductUsecase))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ProductPage(),
      ),
    );
  }
}
