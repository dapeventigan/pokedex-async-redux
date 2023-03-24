import 'package:flutter/material.dart';

const appDefaultColor = Color.fromARGB(255, 13, 39, 83);
const cardOverviewPadding = EdgeInsets.all(15);
const crossAxisAlignmentCenter = CrossAxisAlignment.center;
const pokemonNameFont = TextStyle(fontSize: 20);

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
