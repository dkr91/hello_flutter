import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final int id;

  final List<List<String>> courseList = [
    ["Tugas Akhir", "KP -", "Sabtu 13:00", "TC 04.01", "5sks"],
    ["Emerging Technology", "KP A", "Senin 07:00", "LA 02.06B", "3sks"],
    [
      "Special Topics in Mobile Programming",
      "KP -",
      "Selasa 09:45",
      "LA 02.06B",
      "3sks"
    ],
    ["Numerical Method", "KP A", "Senin 13:00", "TF 02.02", "2sks"],
    [
      "Leadership and Ethics Profession",
      "KP -",
      "Rabu 10:40",
      "TF 04.03",
      "2sks"
    ],
    ["Communicative English", "KP E1", "Jumat 15:45", "TF 03.01", "2sks"]
  ];

  CourseDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Detail'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(courseList[id][0]),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                        style: BorderStyle.solid),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(courseList[id][1]),
                ),
              ),
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                        style: BorderStyle.solid),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(courseList[id][2]),
                ),
              ),
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                        style: BorderStyle.solid),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(courseList[id][3]),
                ),
              ),
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                        style: BorderStyle.solid),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(courseList[id][4]),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
