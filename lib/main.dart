import 'package:flutter/material.dart';
import 'package:nextflow_widget_radio_choice/models/question_model.dart';

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
  QuestionModel question = QuestionModel(
    id: 1,
    title: "ไก่กับไข่อะไรเกิดก่อนกัน",
    choices: [
      Choice(id: 1, title: "ไก่"),
      Choice(id: 2, title: "ไข่"),
      Choice(id: 3, title: "อุบัติขึ้นพร้อมกัน")
    ],
    answerId: 3,
  );

  int _selectedChoice;

  @override
  Widget build(BuildContext context) {
    var questionArea = Column(
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
                  toggleable: true,
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
                  groupValue: _selectedChoice,
                  onChanged: (value) {
                    setState(() {
                      _selectedChoice = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('3'),
                leading: Radio(
                  value: 3,
                  groupValue: _selectedChoice,
                  onChanged: (value) {
                    setState(() {
                      _selectedChoice = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('4'),
                leading: Radio(
                  value: 4,
                  groupValue: _selectedChoice,
                  onChanged: (value) {
                    setState(() {
                      _selectedChoice = value;
                    });
                  },
                ),
              )
            ],
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: questionArea,
      ),
    );
  }
}
