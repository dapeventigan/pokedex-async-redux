import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class PokemonDetailsVmFactory extends VmFactory<AppState, PokemonDetailsVmFactory> {
  @override
  Vm fromStore() => PokemonDetailsVm(pokemonDetails: _pokemonDetails());

  Async<PokemonDetails> _pokemonDetails() {
    if (state.wait.isWaitingFor(GetPokemonDetailsAction.key)) return const Async.loading();
    if (state.pokemonDetails == null) return const Async.error(errorMessage);

    return Async(state.pokemonDetails!);
  }
}

class PokemonDetailsVm extends Vm {
  PokemonDetailsVm({
    required this.pokemonDetails,
  }) : super(equals: [pokemonDetails]);

  final Async<PokemonDetails> pokemonDetails;
}
