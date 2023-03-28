import 'package:dartx/dartx.dart';
import 'package:pokedex_async_redux/api/model/details.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widget/pokemon_ability.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widget/pokemon_general.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widget/pokemon_moves.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widget/pokemon_stats.dart';
import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/colors.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonDetails,
    required this.pokeName,
    required this.pokemonImage,
    Key? key,
  }) : super(key: key);

  final Async<PokemonDetails> pokemonDetails;
  final String pokeName;
  final String pokemonImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        backgroundColor: appDefaultColor,
      ),
      body: pokemonDetails.when(
        loading: () => const Center(child: CircularProgressIndicator(color: appDefaultColor)),
        error: (errorMessage) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage ?? emptyString));
          return const Center(child: Text(noPokemonsAvailable));
        },
        (data) => SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(MaterialCommunityIcons.pokemon_go, color: appDefaultColor),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          pokeName.capitalize(),
                          style: GoogleFonts.vt323(
                            fontSize: 24,
                            color: appDefaultColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: appDefaultColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.network(
                      pokemonImage,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Container(
                  width: 370,
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GeneralDetailsView(
                            detailName: heightText,
                            detailValue: data.height,
                            detailType: heightType,
                          ),
                          GeneralDetailsView(
                            detailName: weightText,
                            detailValue: data.weight,
                            detailType: weightType,
                          ),
                        ],
                      ),
                      GeneralDetailsView(
                        detailName: baseExpText,
                        detailValue: data.baseExperience,
                        detailType: baseExpType,
                      ),
                      StatsView(stats: data.stats),
                      AbilityView(abilities: data.abilities),
                      MovesView(moves: data.moves),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorMessageSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
