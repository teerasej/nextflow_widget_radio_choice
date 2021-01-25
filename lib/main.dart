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
          question.title,
          style: TextStyle(fontSize: 30),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: question.choices.length,
            itemBuilder: (BuildContext context, int index) {
              var choice = question.choices[index];

              return ListTile(
                title: Text(choice.title),
                leading: Radio(
                  toggleable: true,
                  value: choice.id,
                  groupValue: _selectedChoice,
                  onChanged: (value) {
                    setState(() {
                      _selectedChoice = value;
                    });
                  },
                ),
              );
            },
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: RaisedButton(
            onPressed: () {
              var title = "";
              var message = "";

              if (_selectedChoice == question.answerId) {
                title = "ถูกต้อง!";
                message = "ได้ 1 คะแนน";
              } else {
                title = "อุ้ย!";
                message = "ลองใหม่อีกครั้งนะ";
              }

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(title),
                      content: Text(message),
                    );
                  });
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('ยืนยันคำตอบ'),
          ),
        ),
      ),
    );
  }
}
