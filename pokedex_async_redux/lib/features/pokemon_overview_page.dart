import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/features/widget/pokemon_overview_page_gridview.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final List<Pokemon> pokemons;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          backgroundColor: appDefaultColor,
        ),
        body: Center(
          child: PokemonOverviewGridview(pokemons: pokemons),
        ),
      ),
    );
  }
}
