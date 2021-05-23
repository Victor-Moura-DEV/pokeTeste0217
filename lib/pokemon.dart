class Pokemon {
  String nome;
  String urlImage;

  Pokemon(this.nome, this.urlImage);

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    urlImage = json['sprites']['front_default'];
  }
}
