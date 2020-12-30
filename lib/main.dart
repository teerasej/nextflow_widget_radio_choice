import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow Flutter Widget Today',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 3 นาที: '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedChoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. จงหาคำตอบของ 1 + 1',
                style: TextStyle(fontSize: 30),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('1'),
                      leading: Radio(
                        value: 1,
                        groupValue: _selectedChoice,
                        onChanged: (value) {
                          setState(() {
                            _selectedChoice = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('2'),
                      leading: Radio(
                        value: 2,
                      ),
                    ),
                    ListTile(
                      title: Text('3'),
                      leading: Radio(
                        value: 3,
                      ),
                    ),
                    ListTile(
                      title: Text('4'),
                      leading: Radio(
                        value: 4,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
