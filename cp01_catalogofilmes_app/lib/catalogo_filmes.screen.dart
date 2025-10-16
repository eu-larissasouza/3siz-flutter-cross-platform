import 'package:cp01_catalogofilmes_app/domain/movie.dart';
import 'package:flutter/material.dart';

class CatalogoFilmesScreen extends StatefulWidget {
  final String title;
  const CatalogoFilmesScreen({super.key, required this.title});

  @override
  State<CatalogoFilmesScreen> createState() => _CatalogoFilmesScreenState();
}

class _CatalogoFilmesScreenState extends State<CatalogoFilmesScreen> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();

    movies.add(new Movie(title: "Wicked", releaseYear: 2024));
    movies.add(new Movie(title: "Matilda", releaseYear: 1996));
    movies.add(new Movie(title: "High School Musical", releaseYear: 2006));
    movies.add(new Movie(title: "Mudança de Hábito", releaseYear: 1992));
    movies.add(
      new Movie(title: "D.U.F.F. - Você Conhece, Tem ou É", releaseYear: 2015),
    );
    movies.add(
      new Movie(title: "Fantástica Fábrica de Chocolate", releaseYear: 1971),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Catálogo de Filmes", style: TextStyle(fontSize: 20)),
          for (var movie in movies) Text(movie.presenter()),
        ],
      ),
    );
  }
}
