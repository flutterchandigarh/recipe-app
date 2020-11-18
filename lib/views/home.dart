import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/recipe_view.dart';

class Home extends StatelessWidget {
  List<RecipeModel> recipies = new List();
  String ingridients;
  bool _loading = false;
  String query = "";
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242424),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Recipes",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontFamily: 'Overpass'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text(
                "What will you cook today?",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Overpass'),
              ),
              Text(
                "Just Enter Ingredients you have and we will show the best recipe for you",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'OverpassRegular'),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Overpass'),
                        decoration: InputDecoration(
                          hintText: "Enter Ingridients",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'Overpass'),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    InkWell(
                        onTap: () async {
                          // if (textEditingController.text.isNotEmpty) {
                          //   setState(() {
                          //     _loading = true;
                          //   });
                          //   recipies = new List();
                          //   String url =
                          //       "https://api.edamam.com/search?q=${textEditingController.text}&app_id=0f21d949&app_key=8bcdd93683d1186ba0555cb95e64ab26";
                          //   var response = await http.get(url);
                          //   print(" $response this is response");
                          //   Map<String, dynamic> jsonData =
                          //       jsonDecode(response.body);
                          //   print("this is json Data $jsonData");
                          //   jsonData["hits"].forEach((element) {
                          //     print(element.toString());
                          //     RecipeModel recipeModel = new RecipeModel();
                          //     recipeModel =
                          //         RecipeModel.fromMap(element['recipe']);
                          //     recipies.add(recipeModel);
                          //     print(recipeModel.url);
                          //   });
                          //   setState(() {
                          //     _loading = false;
                          //   });

                          //   print("doing it");
                          // } else {
                          //   print("not doing it");
                          // }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.search, size: 18, color: Colors.black),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 25.0,
                  maxCrossAxisExtent: 200.0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(), //Why Required?
                itemCount: recipies.length,
                itemBuilder: (context, index) {
                  return RecipieTile(
                    title: 'Title',
                    imgUrl: 'recipies[index].image',
                    desc: 'recipies[index].source',
                    url: 'recipies[index].url',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipieTile extends StatefulWidget {
  final String title, desc, imgUrl, url;

  RecipieTile({this.title, this.desc, this.imgUrl, this.url});

  @override
  _RecipieTileState createState() => _RecipieTileState();
}

class _RecipieTileState extends State<RecipieTile> {
  // _launchURL(String url) async {
  //   print(url);
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // if (kIsWeb) {
            //   _launchURL(widget.url);
            // } else {
            //   print(widget.url + " this is what we are going to see");
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => RecipeView(
            //                 postUrl: widget.url,
            //               )));
            // }
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                Image.network(
                  widget.imgUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    
                      gradient: LinearGradient(
                          colors: [Colors.white30, Colors.white],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontFamily: 'Overpass'),
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              fontFamily: 'OverpassRegular'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}