import 'dart:convert';

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

Map map = {TabItem.homePage: false};

enum TabItem { homePage, postPage, page3, page4, profile }

extension ParseToString on TabItem {
  String get name {
    return this.toString().split('.').last;
  }
}

class Test {
  String? _title;
  String? _content;

  String get title => _title!;

  set title(String value) {
    _title = value;
  }

  String get content => _content!;

  set content(String value) {
    _content = value;
  }
}

void main() {
  print(null ?? "Abcdfd");
  print("123123" ?? "Abcdfd");

  Test test = Test();
  test.content = "c";
  test.title = "t";

  print(test);

  list.insert(0, 10);
  list.insert(0, 20);
  list.insert(0, 30);

  print(list);
  // print("" == null);
  // var a1 = '0';
  // num b1 = json.decode(a1);
  //
  // // map[TabItem.homePage] = true;
  // map.update(TabItem.homePage, (value) => true);
  // print(map[TabItem.homePage]);
  //
  // /*print(TabItem.homePage.index);
  // print(TabItem.homePage.toString());
  // print(TabItem.homePage.name);*/
  //
  // TabItem t = TabItem.postPage;
  //
  // int a = 1;
  // int b = a ;
  // b = 2;
  //
  // print(a);
  // print(b);
  //
  // print(list.sublist(0,2));
  //
  // Person p = list.sublist(0,2).elementAt(0);
  // p.value = 10;

}
