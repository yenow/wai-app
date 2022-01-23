class Enneagram {
  num _index;
  String _name;
  String _path;


  Enneagram(this._index, this._name, this._path);

  String get name => _name;
  String get path => _path;
}


Map<num,Enneagram> enneagramTypeList = {
  1 : Enneagram(1,'소','assets/images/enneagram/cow.png'),
  2 : Enneagram(2,' 강아지','assets/images/enneagram/dog.png'),
  3 : Enneagram(3,'독수리','assets/images/enneagram/eagle.png'),
  4 : Enneagram(4,'고양이','assets/images/enneagram/cat.png'),
  5 : Enneagram(5,'부엉이','assets/images/enneagram/owl.png'),
  6 : Enneagram(6,'사슴','assets/images/enneagram/deer.png'),
  7 : Enneagram(7,'원숭이','assets/images/enneagram/monkey.png'),
  8 : Enneagram(8,'호랑이','assets/images/enneagram/tiger.png'),
  9 : Enneagram(9,'코끼리','assets/images/enneagram/elephant.png'),
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