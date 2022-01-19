import 'package:flutter/material.dart';

class Person {
  int value;

  Person(this.value);

  @override
  String toString() {
    return 'Person{value: $value}';
  }
}

int i = 1;
int j = 2;

List list = [Person(1),Person(2),3,4,5,6,7];



void main() {
  int a = 1;
  int b = a ;
  b = 2;

  print(a);
  print(b);

  print(list.sublist(0,2));

  Person p = list.sublist(0,2).elementAt(0);
  p.value = 10;

  print(list);
}
