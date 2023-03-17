import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          //TODO: This will be placed in a constant later.
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
