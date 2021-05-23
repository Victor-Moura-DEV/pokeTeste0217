import 'package:flutter_pokemon/api.dart';
import 'package:flutter_pokemon/poke_model.dart';
import 'package:flutter_pokemon/pokemon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FetchPokemon should fill pokemon variable', () {
    final model = PokeModel(api: MockAPI());

    model.fetchPokemon(1);

    expect(model.pokemon, completion(isNotNull));

    model.pokemon.then((pokemon) {
      expect(pokemon.nome, 'Victão');
    });
  });
}

class MockAPI extends API {
  @override
  Future<Pokemon> fetchPokemon(int number) {
    final pokemon = Pokemon('Victão', 'null');
    return Future.value(pokemon);
  }
}
