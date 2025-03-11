import 'package:flutter/material.dart';
import 'package:flutter_study/model/pokemon_model.dart';
import 'package:flutter_study/services/poke_repository.dart';
import 'package:flutter_study/services/poke_service.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({super.key});

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  late final PokemonRepository repository;
  List<PokemonModel> pokemons = [];
  bool isLoading = false;

  Future<void> _fetchMorePokemons() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    try {
      final newPokemons = await repository.fetchPokemons();
      setState(() {
        pokemons.addAll(newPokemons);
      });
    } catch (e) {
      debugPrint('Erro ao carregar mais Pokémon: $e');
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    final PokemonService service = PokemonService();
    repository = PokemonRepository(service);
    _fetchMorePokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pokemons'),
      ),
      body: InfiniteList(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];

          return ListTile(
            title: Text(pokemon.name),
            subtitle: Text(pokemon.url),
            leading: CircleAvatar(
              child: Text(
                pokemon.name[0].toUpperCase(),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        onFetchData: _fetchMorePokemons,
      ),
    );
  }
}
