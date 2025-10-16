import 'package:flutter/material.dart';
import 'package:textformfield_listview_app/custom_input_widget.dart';
import 'package:textformfield_listview_app/explorer.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late GlobalKey _formKey;
  late List<Explorer> listExplorer = [];

  @override
  void initState() {
    _formKey = GlobalKey();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              color: const Color.fromARGB(255, 255, 253, 227),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Formulário"),
                  SizedBox(height: 20),
                  Form(
                    child: Column(
                      key: _formKey,
                      children: [
                        CustomInputWidget(
                          label: "Informe o nome do explorador",
                          controller: _nameController,
                        ),
                        SizedBox(height: 20),
                        CustomInputWidget(
                          label: "Informe a idade do explorador",
                          controller: _ageController,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              final name = _nameController.text;
                              final age = _ageController.text;
                              final explorer = Explorer(name: name, age: age);

                              // pra alterar o estado e redesenhar a tela toda
                              setState(() {
                                listExplorer.add(explorer);
                              });

                              _nameController.clear();
                              _ageController.clear();
                            });
                          },
                          child: Text("Salvar"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 213, 242, 255),
              child: Column(
                children: [
                  Text("Exploradores"),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listExplorer.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(listExplorer[index].name),
                          subtitle: Text(listExplorer[index].age),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
