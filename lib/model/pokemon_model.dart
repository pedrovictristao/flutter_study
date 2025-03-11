class PokemonModel {
  String name;
  String url;

  PokemonModel({required this.name, required this.url});

  // Responsável por fazer a conversão dos dados recebidos da API para um objeto no flutter
  PokemonModel.fromJson(Map<String, dynamic> json)
      : name = json['name'].toString(),
        url = json['url'].toString();
}
