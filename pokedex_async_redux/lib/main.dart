import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/home_page.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

//TODO: Remove Future<void> and async
Future<void> main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

//TODO: Will remove this. Used for debugging purposes
  final pokemons = await ApiService().pokemonApi.getPokemonList(offset: '0', limit: '151');
  pokemons;
//TODO: Will remove this. Used for debugging purposes
  final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(pokemonName: "charizard");
  pokemonDetails;

  runApp(
    StoreProvider(
      store: store,
      child: const HomePage(),
    ),
  );
}
