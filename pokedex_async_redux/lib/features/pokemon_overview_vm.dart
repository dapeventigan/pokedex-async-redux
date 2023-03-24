import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewVmFactory> {
  @override
  Vm fromStore() => PokemonOverviewVm(pokemons: _pokemons);

  List<Pokemon> get _pokemons => state.pokemons;
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({required this.pokemons}) : super(equals: [pokemons]);

  final List<Pokemon> pokemons;
}
