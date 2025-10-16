import 'package:flutter/material.dart';

// Definimos o tipo de chave pix -  ele ja deixa pre separado
class CustomSelectTypes extends StatelessWidget {
  final String? value;
  final void Function(String) onChanged;

  const CustomSelectTypes({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        label: const Text("Selecione o tipo de chave"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
      items: const [
        DropdownMenuItem(value: 'cpf', child: Text("cpf")),
        DropdownMenuItem(value: 'telefone', child: Text("telefone")),
        DropdownMenuItem(value: 'email', child: Text("e-mail")),
      ],
      onChanged: (value) {
        onChanged(value ?? '');
      },
    );
  }
}
