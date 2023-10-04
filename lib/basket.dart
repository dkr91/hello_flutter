import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'recipe.dart';

class Basket extends StatefulWidget {
  @override
  State<Basket> createState() => _BasketPageState();
}

class _BasketPageState extends State<Basket> {
  List<Widget> widRecipes(BuildContext context) {
    List<Widget> temp = [];
    int i = 0;
    while (i < recipes.length) {
      Widget w = Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: -6,
                blurRadius: 8,
                offset: Offset(8, 7),
              ),
            ]
        ),
        child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                      '${recipes[i].name} (${recipes[i].category})',
                      style: TextStyle(
                          fontSize: 25
                      )
                  ),
                  Image(image: NetworkImage(recipes[i].photo)),
                  Text(recipes[i].desc,
                      style: TextStyle(
                          fontSize: 18
                      )),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          print(i);
                          // recipes.remove(recipes[i-1]);
                        });
                      },
                      child: Text("Remove"))
                ],
              ),
            )
        ),
      );
      temp.add(w);
      i++;
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('Basket'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
              Text("Your basket "),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: widRecipes(context),
              ),
              const Divider(
                height: 100,
              )
            ]
            )
        ),
      );
    }
}
