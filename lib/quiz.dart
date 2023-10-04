import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';

import 'questionobj.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _hitung = 5;
  int _initValue = 5;

  int _question_no = Random().nextInt(10);
  int _point = 0;

  List<int> _done_question = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
              CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 20.0,
                percent: 1 - (_hitung / _initValue),
                center: Text(formatTime(_hitung)),
                progressColor: Colors.red,
              ),
              // LinearPercentIndicator(
              //   center: Text(formatTime(_hitung)),
              //   width: MediaQuery.of(context).size.width,
              //   lineHeight: 20.0,
              //   percent: 1 - (_hitung / _initValue),
              //   backgroundColor: Colors.grey,
              //   progressColor: Colors.red,
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         _timer.isActive ? _timer.cancel() : startCountdown();
              //       });
              //     },
              //     child: Text(_timer.isActive ? "Stop" : "Start")),
              Text("Point: $_point"),
              Image(image: NetworkImage(questions[_question_no].photo)),
              Text(questions[_question_no].narration),
              TextButton(
                  onPressed: () {
                    checkAnswer(questions[_question_no].option_a);
                  },
                  child: Text("A. " + questions[_question_no].option_a)),
              TextButton(
                  onPressed: () {
                    checkAnswer(questions[_question_no].option_b);
                  },
                  child: Text("B. " + questions[_question_no].option_b)),
              TextButton(
                  onPressed: () {
                    checkAnswer(questions[_question_no].option_c);
                  },
                  child: Text("C. " + questions[_question_no].option_c)),
              TextButton(
                  onPressed: () {
                    checkAnswer(questions[_question_no].option_d);
                  },
                  child: Text("D. " + questions[_question_no].option_d)),
            ])),
      ),
    );
  }

  int randomize() {
    int random = Random().nextInt(10);

    if (!_done_question.contains(random)) {
      _done_question.add(random);
      return random;
    } else {
      return randomize();
    }
  }

  void checkAnswer(String answer) {
    setState(() {
      if (answer == questions[_question_no].answer) {
        _point += 100;
      }
      _done_question.add(_question_no);
      _question_no = randomize();
      if (_question_no > questions.length - 1) _question_no = 0;
      _hitung = _initValue;
    });
  }

  late Timer
      _timer; // add “late” to initialize it later in initState() @override

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _hitung++;
      });
    });
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_hitung == 0) {
          _timer.cancel();
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text('Quiz'),
                    content: Text('Quiz Ended'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ));
        } else {
          _hitung--;
        }
      });
    });
  }

  void startQuiz() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_hitung > 0) {
          _hitung--;
        } else {
          _question_no = randomize();
          print("Question: $_question_no");
          print(_done_question);
          if (_done_question.length > 5) finishQuiz();
          _hitung = _initValue;
        }
      });
    });
  }

  void finishQuiz() {
     _timer.cancel();
     _question_no = 0;
     showDialog<String>(
         context: context,
         builder: (BuildContext context) => AlertDialog(
         title: Text('Quiz'),
         content: Text('Your point = $_point'),
         actions: <Widget>[
         TextButton(
           onPressed: () {
           Navigator.pop(context, 'OK');
           Navigator.pop(context);
           },
           child: const Text('OK'),
         ),
         ],
      ));
     }


  String formatTime(int hitung) {
    var hours = (hitung ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((hitung % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (hitung % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    // startTimer();
    // startCountdown();

    startQuiz();
  }

  @override
  void dispose() {
    _timer.cancel();
    _hitung = 0;
    super.dispose();
  }
}
