import 'package:flutter_study/model/pokemon_model.dart';
import 'package:flutter_study/services/service_impl.dart';

class PokemonRepository {
  final ServiceImpl service;
  int offset = 0;

  PokemonRepository(this.service);

  Future<List<PokemonModel>> fetchPokemons() async {
    final data = await service.getPokemons(offset);
    offset += service.pageSize;
    return data;
  }
}
