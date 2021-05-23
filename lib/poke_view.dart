import 'package:flutter/material.dart';
import 'package:flutter_pokemon/poke_controller.dart';
import 'package:flutter_pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: FutureBuilder<Pokemon>(
                //future do controller.
                future: controller.pokemon,
                //construtor para pegar o pokemon no controller
                builder: (context, snapshot) {
                  //se a conexão for diferente de finalizada mostre um loading circular
                  if (snapshot.connectionState != ConnectionState.done) {
                    return CircularProgressIndicator();
                  }
                  //se retornar sucesso na consulta do hasData, mostre a imagem.
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        //pegando imagem da internet, FIT é o comando para ajeitar a imagem no container
                        Image.network(
                          snapshot.data.urlImage,
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          snapshot.data.nome,
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    );
                  }
                  return Container();
                }),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                controller.loadPokemon();
              });
            },
            child: Text('Load Pokemon'),
          )
        ],
      ),
    );
  }
}
