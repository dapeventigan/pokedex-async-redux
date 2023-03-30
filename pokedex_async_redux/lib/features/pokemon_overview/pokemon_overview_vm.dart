import 'dart:ui';

import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewVmFactory> {
  @override
  Vm fromStore() => PokemonOverviewVm(
        pokemons: _pokemons(),
        searchedPokemons: state.searchedPokemons,
        getFilteredPokemons: (searchText) => _getFilteredPokemons(searchText),
        clearSearchedPokemons: _clearSearchedPokemons,
      );

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(errorMessage);

    return Async(state.pokemons);
  }

  void _getFilteredPokemons(String searchText) => dispatchSync(SearchPokemonsAction(searchText: searchText));
  void _clearSearchedPokemons() => dispatchSync(ClearSearchedPokemonsAction());
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
    required this.searchedPokemons,
    required this.getFilteredPokemons,
    required this.clearSearchedPokemons,
  }) : super(equals: [pokemons, searchedPokemons]);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final Function(String) getFilteredPokemons;
  final VoidCallback clearSearchedPokemons;
}
