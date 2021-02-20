import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'aboutpage.dart';
import 'package:share/share.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _calculation = [
    "Sum ",
    "Add",
    "Subtraction",
    "Division",
    "Multiplication"
  ];
  var _currentItemselected = "Add";
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var displayText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                color: Colors.teal,
                child: Center(
                  child: Text(
                    "Calculator Using Flutter",
                    style:
                        TextStyle(fontSize: 25.00, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("About"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AboutPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Rate"),
              onTap: () {
                launch(
                    "https://play.google.com/store/apps/details?id=com.tencent.ig&hl=en&gl=US");
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: () {
                Share.share(
                    "Hello you can check out my app at https://play.google.com/store/apps/details?id=com.tencent.ig&hl=en&gl=US ");
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text("Calculator Using Flutter")),
      ),
      body: ListView(
        children: <Widget>[
          DropdownButton<String>(
            items: _calculation.map((String dropdownStringItem) {
              return DropdownMenuItem<String>(
                value: dropdownStringItem,
                child: Text(dropdownStringItem),
              );
            }).toList(),
            value: _currentItemselected,
            onChanged: (String newValueSelected) {
              setState(() {
                this._currentItemselected = newValueSelected;
              });
            },
          ),
          SizedBox(
            height: 15.00,
          ),
          TextField(
            controller: controller1,
            decoration: InputDecoration(
                labelText: "First Number",
                hintText: "200",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal())),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 15.00,
          ),
          TextField(
            controller: controller2,
            decoration: InputDecoration(
                labelText: "Second Number",
                hintText: "100",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal())),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 15.00,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 5.0, color: Colors.tealAccent)),
            child: Text(
              displayText,
              style: TextStyle(fontSize: 25.00),
            ),
          ),
          SizedBox(
            height: 15.00,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                      child: Text("Calculate"),
                      onPressed: () {
                        setState(() {
                          double first = double.parse(controller1.text);
                          double second = double.parse(controller2.text);
                          switch (_currentItemselected) {
                            case "Add":
                              displayText = "The sum is ${first + second}";
                              break;
                            case "Subtraction":
                              displayText =
                                  "The subtraction is ${first - second}";
                              break;
                            case "Division":
                              displayText = "The division is ${first / second}";
                              break;
                            case "Multiplication":
                              displayText =
                                  "The multiplication is ${first * second}";
                              break;
                            case "default":
                              displayText = "The sum and addision are the same";
                          }
                        });
                      }),
                ),
                Expanded(
                  child: RaisedButton(
                      child: Text("Clear"),
                      onPressed: () {
                        controller1.clear();
                        controller2.clear();
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
