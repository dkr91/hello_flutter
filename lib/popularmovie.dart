import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/detailpop.dart';
import 'package:hello_flutter/main.dart';
import 'package:hello_flutter/newmovie.dart';
import 'package:hello_flutter/popmovie.dart';
import 'package:http/http.dart' as http;

class PopularMovie extends StatefulWidget {
  const PopularMovie({Key? key}) : super(key: key);

  @override
  _PopularMovieState createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  String _temp = 'waiting API respond…';
  String _txtcari = "";

  Future<String> fetchData() async {
    final response = await http.post(
        Uri.parse("https://ubaya.me/react/160420016/movielist.php"),
        body: {'cari': _txtcari});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

  bacaData() {
    PMs.clear();
    Future<String> data = fetchData();
    data.then((value) {
      Map json = jsonDecode(value);
      for (var movie in json['data']) {
        PopMovie pm = PopMovie.fromJson(movie);
        PMs.add(pm);
      }
      setState(() {
        _temp = PMs[2].overview;
      });
    });
  }

  Widget DaftarPopMovie(PopMovs) {
    if (PopMovs != null) {
      return ListView.builder(
          itemCount: PopMovs.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Card(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.movie, size: 30),
                  title: GestureDetector(
                    child: Text(PMs[index].title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPop(movieID: PMs[index].id),
                        ),
                      ).then((value) {
                        setState(() {
                          bacaData();
                        });
                      });
                    },
                  ),
                  subtitle: Text(PopMovs[index].overview),
                ),
              ],
            ));
          });
    } else {
      return CircularProgressIndicator();
    }
  }

  Widget DaftarPopMovie2(data) {
    List<PopMovie> PMs2 = [];
    Map json = jsonDecode(data);
    for (var mov in json['data']) {
      PopMovie pm = PopMovie.fromJson(mov);
      PMs2.add(pm);
    }
    return ListView.builder(
        itemCount: PMs2.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Card(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.movie, size: 30),
                title: GestureDetector(
                  child: Text(PMs[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPop(movieID: PMs[index].id),
                      ),
                    ).then((value) {
                      bacaData();
                    });
                  },
                ),
                subtitle: Text(PMs2[index].overview),
              ),
            ],
          ));
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bacaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Newmovie()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Popular Movie'),
      ),
      body: ListView(children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            labelText: 'Judul mengandung kata:',
          ),
          onFieldSubmitted: (value) {
            _txtcari = value;
            bacaData();
          },
        ),
        Container(
          height: MediaQuery.of(context).size.height - 200,
          child: DaftarPopMovie(PMs),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error! ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    return DaftarPopMovie2(snapshot.data.toString());
                  } else {
                    return const Text("No data");
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ]),
    );
  }
}
