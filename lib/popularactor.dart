import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/popactor.dart';
import 'package:http/http.dart' as http;

class PopularActor extends StatefulWidget {
  const PopularActor({super.key});

  @override
  State<PopularActor> createState() => _PopularActorState();
}

class _PopularActorState extends State<PopularActor> {
  Future<String> fetchData() async {
    final response = await http
        .get(Uri.parse("https://ubaya.me/flutter/160420016/popularactor.php"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

  Widget DaftarPopActor(data) {
    List<PopActor> PAs = [];
    Map json = jsonDecode(data);
    for (var actor in json['data']) {
      PopActor pa = PopActor.fromJSON(actor);
      PAs.add(pa);
    }
    return ListView.builder(
        itemCount: PAs.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new Card(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person, size: 30),
                title: Text(PAs[index].name),
              ),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Actor'),
      ),
      body: ListView(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DaftarPopActor(snapshot.requireData);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ]),
    );
  }
}
