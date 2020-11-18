import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242424),
      appBar: AppBar(
        title: Text('Reciepe App'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'What will we do today?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Enter Ingredients",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("CONTAINER PRESSED");
                    },
                    child: Container(
                      color: Colors.red,
                      child: Text('Button'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 25,
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 30),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ReciepeTile(
                    title: "Text Data",
                    description: "Test Description",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReciepeTile extends StatefulWidget {
  String title, description, url, imageurl;
  ReciepeTile({this.title, this.description, this.url, this.imageurl});
  @override
  _ReciepeTileState createState() => _ReciepeTileState();
}

class _ReciepeTileState extends State<ReciepeTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.red),
            ),
          ),
          Container(
            color: Colors.white,
            child: Text(
              widget.description,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
