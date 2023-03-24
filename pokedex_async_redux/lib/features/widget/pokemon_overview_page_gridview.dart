import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

class PokemonOverviewGridview extends StatelessWidget {
  const PokemonOverviewGridview({
    super.key,
    required this.pokemons,
  });

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: numberTwo),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        final pokemonIndex = index + numberOne;
        final String pokemonImageUrlPath =
            pokemonImageUri.replaceAll(RegExp(r'\[index\]'), '$pokemonIndex') + pokemonImageExtention;
        return Card(
          child: Padding(
            padding: cardOverviewPadding,
            child: Column(
              crossAxisAlignment: crossAxisAlignmentCenter,
              children: [
                Text(
                  pokemon.name.capitalize(),
                  style: pokemonNameFont,
                ),
                Expanded(
                  child: Image.network(pokemonImageUrlPath),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
