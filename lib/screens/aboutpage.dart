import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  Text(
                    "This app is made by Aabhushan Adhikari by watching tutorials.",
                    style: TextStyle(fontSize: 35.00),
                  )
                ],
              ),
            ),
          ),
          RaisedButton(
              color: Colors.teal,
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
