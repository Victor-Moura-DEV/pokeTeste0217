import 'package:flutter_pokemon/pokemon.dart';

import 'api.dart';

class PokeModel {
  Future<Pokemon> _pokemon;
  final API api;
  Future<Pokemon> get pokemon => _pokemon;

  PokeModel({this.api = const API()});

  fetchPokemon(int number) {
    _pokemon = api.fetchPokemon(number);
  }
}
