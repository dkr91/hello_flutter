import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/course_detail.dart';

class MyCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyCourses'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/300?img=4'),
                    fit: BoxFit.cover
                  )
              ),
            ),
            Text("John Owen Danuarta"),
            Text("160420016"),
            Text("Teknik Informatika"),
            Text("Gasal 2023/2024"),
            Column(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetail(0)));
                }, child: Text("Tugas Akhir")),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetail(1)));
                }, child: Text("Emerging Technology (A)")),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetail(2)));
                }, child: Text("Special Topics in Mobile Programming")),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetail(3)));
                }, child: Text("Numerical Method (A)")),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetail(4)));
                }, child: Text("Leadership and Ethics Profession")),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetail(5)));
                }, child: Text("Communicative English (E1)"))
              ],
            )
          ],
        ),
      ),
    );
  }
}