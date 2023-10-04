import 'package:flutter/material.dart';
import 'recipe.dart';

class AddRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddRecipeState();
  }
}

class _AddRecipeState extends State<AddRecipe> {
  Color getButtonColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  TextField(
                    controller: _recipe_name_cont,
                    onChanged: (v) {},
                  ),
                  TextField(
                    controller: _recipe_desc_cont,
                    onChanged: (v) {
                      setState(() {
                        _charleft = 200 - v.length;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: null,
                  ),
                  Text("char left : " + _charleft.toString()),
                  TextField(
                    controller: _recipe_photo_cont,
                    onSubmitted: (v) {
                      setState(() {
                        _recipe_photo_cont.text = v;
                      });
                    },
                  ),
                  Image.network(_recipe_photo_cont.text),
                  DropdownButton(
                      value: _recipe_category,
                      items: const [
                        DropdownMenuItem(
                          child: Text("Traditional"),
                          value: "Traditional",
                        ),
                        DropdownMenuItem(
                          child: Text("Japanese"),
                          value: "Japanese",
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _recipe_category = value!;
                        });
                      }),
                  ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor:
                        MaterialStateProperty.resolveWith(getButtonColor),
                      ),
                      onPressed: () {
                        recipes.add(Recipe(
                          id: recipes.length + 1,
                          name: _recipe_name_cont.text,
                          category: _recipe_category,
                          desc: _recipe_desc_cont.text,
                          photo: _recipe_photo_cont.text,
                        ));
                        showDialog<String>(
                          context: context,
                            useRootNavigator: false,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Add Recipe'),
                            content: Text('Recipe successfully added'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                      },
                      child: Text('SUBMIT'))
                ],
              ),
            )),
      ),
    );
  }

  final TextEditingController _recipe_name_cont = TextEditingController();
  final TextEditingController _recipe_desc_cont = TextEditingController();
  final TextEditingController _recipe_photo_cont = TextEditingController();

  String _recipe_category = "Traditional";

  int _charleft = 0;

  @override
  void initState() {
    super.initState();
    _charleft = 200 - _recipe_desc_cont.text.length;

    _recipe_name_cont.text = "your food name";
    _recipe_desc_cont.text = "Recipe of ..";
    _recipe_photo_cont.text = 'https://assets.unileversolutions.com/recipes-v3/244819-default.png';
  }
}
