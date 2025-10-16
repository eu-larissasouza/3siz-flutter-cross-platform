import 'package:flutter/material.dart';
import 'package:gerenciamento_estado_app/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _homeViewModel = Provider.of(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Informe o nome:"),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: "Informe a idade:"),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              final name = _nameController.text;
              final age = _ageController.text;
              _homeViewModel.add(name, age);
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }
}
