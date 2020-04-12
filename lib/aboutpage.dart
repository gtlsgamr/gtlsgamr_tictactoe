import 'package:flutter/material.dart';

class aboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("about me", style: TextStyle(color: Colors.white))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(
          padding: EdgeInsets.all(50.0),
          child: Text("I am Hittarth Thummar, and I am Learning flutter!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                
              )),
        ),
        Icon(Icons.favorite, color: Colors.pink, size: 40.0)
      ]),
    );
  }
}
