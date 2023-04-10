import 'dart:convert';

import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  static const String url = 'https://pokeapi.co/api/v2/';
  static const String urlPokemons = '$url/pokemon/';
  final client = http.Client();

  Future<List<Pokemon>> getAll() async {
    http.Response response = await client.get(Uri.parse(urlPokemons));
    print(response.body);

    if (response.statusCode != 200) {
      throw Exception();
    }

    List<Pokemon> list = [];

    dynamic jsonResponse = json.decode(response.body); //json para Dart objeto
    //Verifica se é lista
    if (jsonResponse['results'] is List<dynamic>) {
      for (var jsonMap in jsonResponse['results']) {
        list.add(Pokemon.fromMap(jsonMap));
      }
      //Verifica se é Map
    } else if (jsonResponse is Map<String, dynamic>) {
      list.add(Pokemon.fromMap(jsonResponse));
    }

    return list;
  }

  Future<Pokemon> fetchPokemon(String url) async {
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return Pokemon.fromJson(json);
  }
}
