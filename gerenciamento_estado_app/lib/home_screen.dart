import 'package:flutter/material.dart';
import 'package:gerenciamento_estado_app/components/custom_input_widget.dart';
import 'package:gerenciamento_estado_app/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
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
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // sempre que algo mudar no view model, vai redesenhar essa parte da tela
    _homeViewModel = context.watch<HomeViewModel>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Gerenciamento de estado")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const Text("Pré-Cadastro", style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomInputWidget(
                                label: "Informe o nome",
                                controller: _nameController,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomInputWidget(
                                label: "Informe a idade",
                                controller: _ageController,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // adiciona um item
                            _homeViewModel.add(
                              _nameController.text,
                              _ageController.text,
                            );
                          },
                          child: Text("Salvar"),
                        ),
                        Expanded(
                          flex: 7,
                          child: ListView.builder(
                            itemCount: _homeViewModel.listExplorers.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  "${_homeViewModel.listExplorers[index].name}",
                                ),
                                subtitle: Text(
                                  "${_homeViewModel.listExplorers[index].age}",
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(flex: 7, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
