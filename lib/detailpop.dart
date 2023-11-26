import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/popmovie.dart';
import 'package:http/http.dart' as http;

class DetailPop extends StatefulWidget {
  int movieID;
  DetailPop({super.key, required this.movieID});
  @override
  State<StatefulWidget> createState() {
    return _DetailPopState();
  }
}

class _DetailPopState extends State<DetailPop> {
  PopMovie? _pm;
  @override
  void initState() {
    super.initState();
    bacaData();
  }

  Future<String> deleteRequest() async {
    final response = await http.post(
        Uri.parse("https://ubaya.me/react/160420016/deletemovie.php"),
        body: {'id': widget.movieID.toString()});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

  Future<String> fetchData() async {
    final response = await http.post(
        Uri.parse("https://ubaya.me/react/160420016/detailmovie.php"),
        body: {'id': widget.movieID.toString()});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

  bacaData() {
    fetchData().then((value) {
      Map json = jsonDecode(value);
      _pm = PopMovie.fromJson(json['data']);
      setState(() {});
    });
  }

  hapusData() {
    deleteRequest().then((value) {
      Map json = jsonDecode(value);
      if (json['result'] == 'success') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Movie Deleted')));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error')));
      }
    });
  }

  Widget tampilData() {
    if (_pm == null) {
      return const CircularProgressIndicator();
    }
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(_pm!.title, style: const TextStyle(fontSize: 25)),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              _pm!.overview,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Genre:"),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _pm?.genres?.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Text(_pm?.genres?[index]['genre_name']);
                }),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Casts:"),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _pm?.genres?.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Text(
                      "${_pm?.casts?[index]['person_name']} as ${_pm?.casts?[index]['character_name']}");
                }),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail of Popular Movie'),
        ),
        body: ListView(children: <Widget>[
          tampilData(),
          FilledButton(
            onPressed: () {
              hapusData();
            },
            child: const Text("Delete Movie"),
          ),
        ]));
  }
}
