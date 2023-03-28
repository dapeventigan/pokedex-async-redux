import 'package:pokedex_async_redux/utilities/colors.dart';
import 'package:flutter/material.dart';

class GeneralDetailsView extends StatelessWidget {
  const GeneralDetailsView({
    required this.detailName,
    required this.detailValue,
    required this.detailType,
    Key? key,
  }) : super(key: key);

  final double detailValue;
  final String detailName;
  final String detailType;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        "$detailName: ${detailValue.toString().split(".").first} $detailType",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colorBlack,
        ),
      ),
    );
  }
}
