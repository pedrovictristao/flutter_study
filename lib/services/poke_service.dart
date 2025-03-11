import 'dart:convert';
import 'package:flutter_study/model/pokemon_model.dart';
import 'package:flutter_study/services/service_impl.dart';
import 'package:http/http.dart' as http;

class PokemonService implements ServiceImpl {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  @override
  Future<List<PokemonModel>> getPokemons(int offset) async {
    final response = await http.get(
      Uri.parse('$baseUrl?limit=$pageSize&offset=$offset'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['results'])
          .map((element) => PokemonModel.fromJson(element))
          .toList();
    } else {
      throw Exception('Erro ao carregar os Pokémon');
    }
  }

  @override
  int get pageSize => 20;
}
