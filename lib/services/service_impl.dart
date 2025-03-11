import 'package:flutter_study/model/pokemon_model.dart';

abstract class ServiceImpl {
  int get pageSize;
  Future<List<PokemonModel>> getPokemons(int offset);
}
