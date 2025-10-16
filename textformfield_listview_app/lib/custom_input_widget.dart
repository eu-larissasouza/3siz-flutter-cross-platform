import 'package:flutter/material.dart';

// ao inves de ficar recriando o TextFormField, criamos um componente que 
// agrupa essa config e passamos isso de forma mais simples
class CustomInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomInputWidget({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
