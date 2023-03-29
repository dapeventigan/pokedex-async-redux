import 'package:dartx/dartx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/utilities/colors.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

class AbilityView extends StatelessWidget {
  const AbilityView({
    required this.abilities,
    Key? key,
  }) : super(key: key);

  final List<PokemonAbilities> abilities;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 38),
            child: Text(
              abilitiesText,
              textAlign: TextAlign.left,
              style: GoogleFonts.vt323(
                fontSize: 28.0,
                color: appDefaultColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
          width: 330.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: appDefaultColor),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
              ),
              itemCount: abilities.length,
              itemBuilder: (context, index) {
                final ability = abilities[index].ability;
                return Chip(label: Text(ability.name.capitalize()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
