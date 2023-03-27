import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewVmFactory> {
  @override
  Vm fromStore() => PokemonOverviewVm(pokemons: _pokemons());

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(noPokemonAvailable);

    return Async(state.pokemons);
  }
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
  }) : super(equals: [pokemons]);

  final Async<List<Pokemon>> pokemons;
}
