import 'package:flutter_study/services/poke_repository.dart';
import 'package:flutter_study/services/poke_service_mock.dart';
import 'package:flutter_study/services/service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('GetPokemons', () async {
    ServiceImpl service = PokeServiceMock();
    PokemonRepository repository = PokemonRepository(service);
    var pokemon = await repository.fetchPokemons();

    expect(repository.service.pageSize, equals(20));
    expect(pokemon.length, equals(40));
    expect(pokemon.any((element) => element.name == 'ninetales'), true);
  });
}
