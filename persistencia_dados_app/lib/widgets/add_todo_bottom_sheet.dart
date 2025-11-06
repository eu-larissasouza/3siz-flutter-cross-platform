import 'package:flutter/material.dart';

// COMPONENTE PARA ADICIONAR NOVAS TAREFAS

class AddTodoBottomSheet extends StatefulWidget {
  final ValueChanged<String>? onAdd;

  const AddTodoBottomSheet({super.key, this.onAdd});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    widget.onAdd?.call(text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Adicionar nova tarefa",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Título da tarefa",
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
