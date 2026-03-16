import 'package:flutter/material.dart';
import 'package:marauders_app/core/custom_http_client.dart';
import 'package:marauders_app/data/datasources/character_datasource.dart';
import 'package:marauders_app/data/repositories/character_repository_impl.dart';
import 'package:marauders_app/domain/usecases/get_characters_usecase.dart';
import 'package:marauders_app/presentation/controller/character_controller.dart';
import 'package:marauders_app/presentation/pages/character_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final httpClient = CustomHttpClient();
    final dataSource = CharacterDatasource(httpClient);
    final repository = CharacterRepositoryImpl(dataSource);
    final getCharactersUsecase = GetCharactersUsecase(repository);

    // Provider são todas as camadas que criamos
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterController(getCharactersUsecase),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const CharacterPage(),
      ),
    );
  }
}
