// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, prefer_is_empty

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Icon> _scoreTracker = [];
  int questionIndex = 0;
  int totalScore = 0;
  bool answerwasSelected = false;
  bool endofQuiz = false;

  void _questionAnswered(bool answerScore) {
    setState(() {});
    setState(() {
      answerwasSelected = true;

      if (answerScore) {
        totalScore++;
      }

      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_box,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );

      if (questionIndex + 1 == _questions.length) {
        endofQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      questionIndex++;
      answerwasSelected = false;
      if (questionIndex >= _questions.length) {
        _resetQuestion();
      }
    });
  }

  void _resetQuestion() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
      endofQuiz = false;
      _scoreTracker = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("နေကောင်းလား"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              if (_scoreTracker.length == 0)
                SizedBox(
                  height: 30,
                ),
              if (_scoreTracker.length > 0) ..._scoreTracker
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 90,
              color: Colors.amber[50],
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Center(
                child: Text(
                  _questions[questionIndex]['question'].toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ...(_questions[questionIndex]['answers']
                  as List<Map<String, dynamic>>)
              .map(
            (answer) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: answerwasSelected
                      ? answer['score']
                          ? Colors.green
                          : Colors.red
                      : Colors.white,
                ),
                onPressed: () {
                  print('success onpressed button');
                  if (answerwasSelected) {
                    return;
                  }
                  _questionAnswered(answer['score']);
                },
                child: Center(
                  child: Text(
                    answer['answerText'],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ), /* Button(
              answerText: answer['answerText'].toString(),
              answerColor: answerwasSelected
                  ? answer['score']
                      ? Colors.green
                      : Colors.red
                  : Colors.cyanAccent,
              answerTap: () {
                print('${answer['score']}');
                if (answerwasSelected) {
                  return;
                }
                _questionAnswered(answer['score']);
              },
            ), */
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () => _nextQuestion(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Next Question'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: prefer_const_declarations, unused_element
final _questions = const [
  {
    'question': 'တစ်မိုင်မှာ ဘယ်နှပေ ရှိသလဲ',
    'answers': [
      {'answerText': '၅၀၈၃၇၂၆ ပေ', 'score': true},
      {'answerText': '၄၉၃၃၈ ပေ', 'score': false},
      {'answerText': '၁၈၂၈၃၇၇၃ ပေ', 'score': false},
    ],
  },
  {
    'question': 'သမင်တွေက ညပိုင်းမှာ မြင်ရပါ သလား',
    'answers': [
      {'answerText': 'မြင်ရ ပါတယ်', 'score': true},
      {'answerText': 'မ မြင်ရ ပါဘူး', 'score': false},
      {'answerText': 'နည်းနည်း မြင်ရပါတယ်', 'score': false},
    ],
  },
  {
    'question': 'ကလေး ငယ်တွေ ဘာကြောင့် အိပ်ရေး ဝဝ အိပ်သင့် သလဲ',
    'answers': [
      {'answerText': 'စကား များလို့', 'score': false},
      {'answerText': 'ကြီး ထွားမှု နှုန်း မြန်အောင်လို့', 'score': true},
      {'answerText': 'တချိန်လုံး စောင့်ကြည့်နေ ရ လို့', 'score': false},
    ],
  }
];
