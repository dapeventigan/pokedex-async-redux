import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

import '../../utilities/string_constant.dart';

/// Setting of pokemons from pokemon api
class GetPokemonsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemons =
        await ApiService().pokemonApi.getPokemonList(offset: pokemonActionOffset, limit: pokemonActionLimit);

    return state.copyWith(pokemons: pokemons);
  }
}
