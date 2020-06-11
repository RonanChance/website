import 'package:flutter/material.dart';
import 'clipper.dart';
import 'dart:html' as html;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ronan Chance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 750,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF090B61),
                    Color(0xFF7AAEFF),
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 250,
                  ),
                  Positioned(
                      top: 20,
                      left: 150,
                      child: Text(
                        'Ronan Chance Donovan',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 35.0,),
                      )),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          html.window
                              .open("https://github.com/RonanChance", "Git");
                        },
                        child: Text("Github"),
                        color: Colors.white,
                      ),
                      MaterialButton(
                        onPressed: () {
                          html.window
                              .open("https://github.com/RonanChance", "Git");
                        },
                        child: Text("Github"),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child:
              FloatingActionButton(child: Icon(Icons.email), onPressed: () {}),
        ),
      ),
    );
  }
}
