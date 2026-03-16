import 'package:flutter/material.dart';
import 'package:marauders_app/presentation/controller/character_controller.dart';
import 'package:provider/provider.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  void initState() {
    super.initState();
    // Seguindo o padrão de buscar os dados no initState
    final controller = context.read<CharacterController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CharacterController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa do Maroto"),
        centerTitle: true,
        backgroundColor: Colors.red[900], // Cor de Gryffindor
        foregroundColor: Colors.white,
      ),
      body: Builder(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Erro ao conjurar personagens: ${controller.error!}",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.characters.length,
            itemBuilder: (_, index) {
              final character = controller.characters[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: character.image.isNotEmpty
                      ? NetworkImage(character.image)
                      : null,
                  child: character.image.isEmpty
                      ? const Icon(Icons.person)
                      : null,
                ),
                title: Text(
                  character.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("${character.species} - ${character.house}"),
                trailing: character.isWizard
                    ? const Icon(Icons.bolt, color: Colors.amber)
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
