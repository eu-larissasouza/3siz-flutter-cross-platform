class Movie {
  String title;
  int releaseYear;

  Movie({required this.title, required this.releaseYear});

  String classifyMovie() {
    if (releaseYear > 2015) {
      return "Recente";
    } else if (releaseYear >= 2000) {
      return "Moderno";
    } else {
      return "Clássico";
    }
  }

  String presenter() {
    return "Filme: $title\nAno de Lançamento: $releaseYear\nClassificação: ${classifyMovie()}\n";
  }
}
