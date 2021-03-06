import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/moviesearch/model.dart';
import 'package:flutter_practice/pages/pokemon/pokemo_home.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String api_key = "f89d5d60dfa1cd841ea935bce37849a9";

class MovieSearchPage extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => new _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  List<Movie> movies = List();
  bool hasLoaded = true;

  final PublishSubject subject = PublishSubject<String>();

  @override
  void initState() {
    super.initState();
    subject.stream.debounce(Duration(milliseconds: 400)).listen(searchMovies);
  }

  void searchMovies(dynamic query) {
    resetMovies();
    if (query.isEmpty) {
      setState(() {
        hasLoaded = true;
      });
    } else {
      setState(() {
        hasLoaded = false;
      });

      http
          .get(
              "https://api.themoviedb.org/3/search/movie?query=$query&api_key=$api_key")
          .then((res) => res.body)
          .then(json.decode)
          .then((map) => map["results"])
          .then((movies) => movies.forEach(addMovie))
          .catchError(onError)
          .then((e) {
        setState(() {
          hasLoaded = true;
        });
      });
    }
  }

  void onError(dynamic d) {
    setState(() {
      hasLoaded = true;
    });
  }

  void addMovie(item) {
    setState(() {
      movies.add(Movie.fromJson(item));
    });
    print('${movies.map((m) => m.title)}');
  }

  void resetMovies() {
    setState(() {
      movies.clear();
    });
  }

  @override
  void dispose() {
    subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Movie Search"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchData());
            },
          )
        ],
      ),
      drawer: Drawer(),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (String value) => (subject.add(value)),
            ),
            hasLoaded ? Container() : CircularProgressIndicator(),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new ExpansionTile(
                        key: Key(movies[index].id.toString()),
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                text: movies[index].overview,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                        title: Container(
                            height: 200.0,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                movies[index].posterPath != null
                                    ? Hero(
                                        child: Image.network(
                                            "https://image.tmdb.org/t/p/w92${movies[index].posterPath}"),
                                        tag: movies[index].id,
                                      )
                                    : Container(),
                                Expanded(
                                    child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          movies[index].title,
                                          maxLines: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            )));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class SearchData extends SearchDelegate<String> {
  final cities = [
    "Mumbai",
    "Delhi",
    "Bengaluru",
    "Ahmedabad",
    "Hyderabad",
    "Chennai",
    "Kolkata",
    "Pune",
    "Jaipur",
    "Surat",
    "Lucknow",
    "Kanpur",
    "Nagpur",
    "Patna",
    "Indore",
    "Thane",
    "Bhopal",
    "Visakhapatnam",
    "Vadodara",
    "Firozabad",
    "Ludhiana",
    "Rajkot",
    "Agra",
    "Siliguri",
    "Nashik",
    "Faridabad",
    "Patiala",
    "Meerut",
    "Kalyan-Dombivali",
    "Vasai-Virar",
    "Varanasi",
    "Srinagar",
    "Dhanbad",
    "Jodhpur",
    "Amritsar",
    "Raipur",
    "Allahabad",
    "Coimbatore",
    "Jabalpur",
    "Gwalior",
    "Vijayawada",
    "Madurai",
    "Guwahati",
    "Chandigarh"
  ];

  final recentCities = [
    "Delhi",
    "Bengaluru",
    "Ahmedabad",
    "Hyderabad",
    "Chennai",
    "Kolkata"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // left icon on app bar
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // so result based on selection
    return PokemonHomePage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when some one search for item
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                showResults(context);
              },
              leading: Icon(Icons.location_city),
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ])),
            ),
        itemCount: suggestionList.length);
  }
}
