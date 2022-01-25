class Enneagram {
  num _index;
  String _name;
  String _path;
  String _subName;


  Enneagram(this._index, this._name, this._path, this._subName);

  String get name => _name;
  String get path => _path;
  String get subName => _subName;
}


Map<num,Enneagram> enneagramTypeList = {
  1 : Enneagram(1,'소','assets/images/enneagram/cow.png', "개혁가"),
  2 : Enneagram(2,' 강아지','assets/images/enneagram/dog.png', "돕는 사람"),
  3 : Enneagram(3,'독수리','assets/images/enneagram/eagle.png', "성취하는 사람"),
  4 : Enneagram(4,'고양이','assets/images/enneagram/cat.png', "예술가"),
  5 : Enneagram(5,'부엉이','assets/images/enneagram/owl.png', "탐구자"),
  6 : Enneagram(6,'사슴','assets/images/enneagram/deer.png', "충실한 사람"),
  7 : Enneagram(7,'원숭이','assets/images/enneagram/monkey.png', "열정적인 사람"),
  8 : Enneagram(8,'호랑이','assets/images/enneagram/tiger.png', "도전하는 사람"),
  9 : Enneagram(9,'코끼리','assets/images/enneagram/elephant.png', "평화주의자"),
};                   


/*List<EnneagramType> enneagramTypelist = [
  EnneagramType(1,'소','assets/images/enneagram/cow.png'),
  EnneagramType(2,' 강아지','assets/images/enneagram/dog.png'),
  EnneagramType(3,'독수리','assets/images/enneagram/eagle.png'),
  EnneagramType(4,'고양이','assets/images/enneagram/cat.png'),
  EnneagramType(5,'부엉이','assets/images/enneagram/owl.png'),
  EnneagramType(6,'사슴','assets/images/enneagram/deer.png'),
  EnneagramType(7,'원숭이','assets/images/enneagram/monkey.png'),
  EnneagramType(8,'호랑이','assets/images/enneagram/tiger.png'),
  EnneagramType(9,'코끼리','assets/images/enneagram/elephant.png'),
];*/