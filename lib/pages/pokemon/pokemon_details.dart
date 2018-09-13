import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/pokemon/poke_hub.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetails({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 80.0),
                Text(
                  pokemon.name,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Text("Height: ${pokemon.height}"),
                Text("Weight: ${pokemon.weight}"),
                Text(
                  "Types",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((t) => FilterChip(
                            backgroundColor: Colors.amber,
                            onSelected: (bool value) {},
                            label: Text(t),
                          ))
                      .toList(),
                ),
                Text("Weakness", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses
                      .map((t) => FilterChip(
                          backgroundColor: Colors.red,
                          label: Text(
                            t,
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (b) {}))
                      .toList(),
                ),
                Text("Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                pokemon.nextEvolution != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.nextEvolution
                            .map((n) => FilterChip(
                                backgroundColor: Colors.green,
                                label: Text(n.name,
                                    style: TextStyle(color: Colors.white)),
                                onSelected: (b) {}))
                            .toList(),
                      )
                    : new Container(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(pokemon.img), fit: BoxFit.cover)),
              )),
        )
      ],
    );
  }
}
