import 'package:dartx/dartx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/utilities/colors.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

class MovesView extends StatelessWidget {
  const MovesView({
    required this.moves,
    Key? key,
  }) : super(key: key);

  final List<PokemonMoves> moves;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Text(
                movesText,
                textAlign: TextAlign.left,
                style: GoogleFonts.vt323(
                  fontSize: 28.0,
                  color: appDefaultColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
            width: 330.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: appDefaultColor),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3,
                ),
                itemCount: moves.length,
                itemBuilder: (context, index) {
                  final move = moves[index].move;
                  return Chip(label: Text(move.name.capitalize()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
