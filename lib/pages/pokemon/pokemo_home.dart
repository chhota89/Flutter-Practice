import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/pokemon/poke_hub.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//json 2 dart file convert https://javiercbk.github.io/json_to_dart/
class PokemonHomePage extends StatefulWidget {
  @override
  _PokemonHomePageState createState() => new _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage> {
  var pokemonUrl =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(pokemonUrl);
    var decodeJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodeJson);
    print(pokeHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return new Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        backgroundColor: Colors.cyan,
      ),
      body: pokeHub == null
          ? new Center(
              child: CircularProgressIndicator(),
            )
          : new GridView.count(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              children: pokeHub.pokemon
                  .map((poke) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          child: Hero(
                              tag: poke.img,
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      height: 100.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(poke.img))),
                                    ),
                                    Text(
                                      poke.name,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )),
                          onTap: () {},
                        ),
                      ))
                  .toList()),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
