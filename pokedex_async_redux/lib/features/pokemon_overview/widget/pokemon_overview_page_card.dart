import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonId = pokemon.url.split(urlSplitter)[idIndex];
    final String pokemonImageUrlPath = pokemonImageUri.replaceAll(indexValue, pokemonId);

    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PokemonDetailsConnector(pokemonName: pokemon.name, pokemonImage: pokemonImageUrlPath)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pokemon.name.capitalize(),
                style: const TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Image.network(pokemonImageUrlPath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
