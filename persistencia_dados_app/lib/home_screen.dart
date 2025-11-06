import 'package:flutter/material.dart';
import 'package:persistencia_dados_app/viewmodel/home_view_model.dart';
import 'package:persistencia_dados_app/widgets/add_todo_bottom_sheet.dart';
import 'package:provider/provider.dart';

// REPRESENTA A NOSSA TELA - UI

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // NOSSA VIEW CONTROLA A TELA
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    // REFERENCIA A INSTANCIA DEFINIDA NO CONTEXTO DO APP PELO PROVIDER
    _homeViewModel = context.read<HomeViewModel>();
    _homeViewModel.fetchTodo();
    super.initState();
  }

  void _showAddTodoSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => AddTodoBottomSheet(
        onAdd: (value) {
          // ADICIONA NA LISTA
          _homeViewModel.add(value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // SEMPRE QUE ALGO MUDAR NO VIEW MODEL, VAI REDESENHAR ESSA PARTE DA TELA
    _homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Minhas Tarefas"), centerTitle: true),
      body: ListView.builder(
        itemCount: _homeViewModel.todos.length,
        itemBuilder: (context, index) {
          // INCLUI O 
          final todo = _homeViewModel.todos[index];

          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {},
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: CheckboxListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  // CONSIDERA O DONE PRA MARCAR O CHECKBOX
                  decoration: todo.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              //LEMBRAR DE ALTERAR O VALOR
              value: todo.done,
              onChanged: (value) {
                // CRIA UMA CÓPIA DO ITEM COM O VALOR ALTERADO
                final updateTodo = todo.copyWith(done: value);
                _homeViewModel.update(updateTodo);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
