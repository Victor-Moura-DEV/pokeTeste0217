import 'dart:convert';

import 'package:flutter_pokemon/pokemon.dart';
import 'package:http/http.dart' as http;

class API {
  const API();

  Future<Pokemon> fetchPokemon(int number) async {
    final response =
        await http.get(Uri.https('pokeapi.co', '/api/v2/pokemon/$number'));

    if (response.statusCode == 200) {
      final pokemon = Pokemon.fromJson(jsonDecode(response.body));
      return pokemon;
    } else {
      return Future.error('Pokemon Not Found');
    }
  }
}
