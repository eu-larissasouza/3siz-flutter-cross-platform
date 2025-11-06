import 'dart:io';

import 'package:flutter/material.dart';
import 'package:persistencia_dados_app/home_screen.dart';
import 'package:persistencia_dados_app/services/data_base_service.dart';
import 'package:persistencia_dados_app/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => DataBaseService()),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(context.read<DataBaseService>()),
        ),
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
      title: 'Aula 05 de Nov',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF0175C2),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 20,
            height: 1.6,
            color: Colors.black87,
          ),
          headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
