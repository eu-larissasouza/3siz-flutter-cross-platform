import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gerenciamento_estado_app/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:gerenciamento_estado_app/home_view_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // linha especial para as plataformas entenderem o banco de dados
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // banco de dados
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  
  // gerenciamento de estado
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel())
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
