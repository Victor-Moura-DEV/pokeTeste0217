import 'dart:math';

import 'package:flutter_pokemon/poke_model.dart';
import 'package:flutter_pokemon/pokemon.dart';

class PokeController {
  final model = PokeModel();
  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    //Random + .nextInt(numero de objetos no array) = pegar um numero aleatorio na lista
    model.fetchPokemon(Random().nextInt(1000));
  }
}
