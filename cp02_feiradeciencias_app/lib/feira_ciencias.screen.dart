import 'package:cp02_feiradeciencias_app/custom_input_widget.dart';
import 'package:cp02_feiradeciencias_app/domain/project.dart';
import 'package:flutter/material.dart';

class FeiraCienciasScreen extends StatefulWidget {
  final String title;
  const FeiraCienciasScreen({super.key, required this.title});

  @override
  State<FeiraCienciasScreen> createState() => _FeiraCienciasScreenState();
}

class _FeiraCienciasScreenState extends State<FeiraCienciasScreen> {
  late TextEditingController _nameController;
  late TextEditingController _responsableController;
  late GlobalKey<FormState> _formKey;
  final List<Project> projectList = [];

  @override
  void initState() {
    _formKey = GlobalKey();
    _nameController = TextEditingController();
    _responsableController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _responsableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Projetos',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Projetos cadastrados (${projectList.length})",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: projectList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(projectList[index].name),
                          subtitle: Text(
                            "Responsável: ${projectList[index].responsable}",
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    child: Column(
                      key: _formKey,
                      children: [
                        CustomInputWidget(
                          label: "Nome do projeto",
                          controller: _nameController,
                        ),
                        SizedBox(height: 20),
                        CustomInputWidget(
                          label: "Responsável",
                          controller: _responsableController,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () {
                                clear();
                              },
                              child: Text("Limpar"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_nameController.text.isNotEmpty &&
                                      _responsableController.text.isNotEmpty) {
                                    saveProject();
                                  }
                                });
                              },
                              child: Text("Salvar"),
                            ),
                          ],
                        ),
                      ],
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

  void clear() {
    setState(() {
      _nameController.clear();
      _responsableController.clear();
    });
  }

  void saveProject() {
    final nameText = _nameController.text;
    final responsableText = _responsableController.text;

    final project = Project(name: nameText, responsable: responsableText);

    setState(() {
      projectList.add(project);
    });

    clear();
  }
}
