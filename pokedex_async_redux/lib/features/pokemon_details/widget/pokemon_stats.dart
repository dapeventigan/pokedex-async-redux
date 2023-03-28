import 'package:dartx/dartx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/utilities/colors.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

class StatsView extends StatelessWidget {
  const StatsView({
    required this.stats,
    Key? key,
  }) : super(key: key);

  final List<PokemonStats>? stats;

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
                statsText,
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
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 8,
                  ),
                  itemCount: stats?.length,
                  itemBuilder: (context, index) {
                    final stat = stats?[index].stat;
                    final baseStat = stats?[index].baseStat;
                    return Text(
                      "${stat?.name.capitalize()} : ${baseStat.toString().split('.').first}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
