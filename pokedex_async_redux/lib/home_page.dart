import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: This will be placed in a constant later.
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
