import 'package:flutter/material.dart';

// deixamos a lista de cidades disponiveis e padronizamos a forma de escrita
class CustomSelectCities extends StatelessWidget {
  final String? value;
  final void Function(String) onChanged;

  const CustomSelectCities({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        label: const Text("Selecione a cidade"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
      items: const [
        DropdownMenuItem(value: 'sao paulo', child: Text("São Paulo")),
        DropdownMenuItem(value: 'guaruja', child: Text("Guarujá")),
        DropdownMenuItem(value: 'ilheus', child: Text("Ilhéus")),
      ],
      onChanged: (value) {
        onChanged(value ?? '');
      },
    );
  }
}
