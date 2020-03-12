import 'package:flutter/material.dart';

List<DropdownMenuItem<double>> lessonCreditItems() {
  List<DropdownMenuItem<double>> credits = [];

  for (double i = 1; i <= 10; i++) {
    int x = i.toInt();
    credits.add(DropdownMenuItem<double>(
      value: i,
      child: Text(x.toString()),
    ));
    double y = i + 0.5;
    credits.add(DropdownMenuItem<double>(
      value: y,
      child: Text(y.toString()),
    ));
  }
  return credits;
}

List<DropdownMenuItem<double>> lessonGradeItems() {
  List<DropdownMenuItem<double>> grades = [];

  grades.add(DropdownMenuItem<double>(
    child: Text("AA"),
    value: 4.0,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("AB"),
    value: 3.7,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("BA"),
    value: 3.3,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("BB"),
    value: 3.0,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("BC"),
    value: 2.7,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("CB"),
    value: 2.3,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("CC"),
    value: 2.0,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("CD"),
    value: 1.7,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("DC"),
    value: 1.3,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("DD"),
    value: 1.0,
  ));
  grades.add(DropdownMenuItem<double>(
    child: Text("FF"),
    value: 0.0,
  ));

  return grades;
}