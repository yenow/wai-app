class EnneagramType {
  num _index;
  String _name;
  String _path;


  EnneagramType(this._index, this._name, this._path);

  String get name => _name;
  String get path => _path;
}

Map<num,EnneagramType> enneagramType = {
  1 : EnneagramType(1,'소','assets/images/enneagram/cow.png'),
  2 : EnneagramType(2,' 강아지','assets/images/enneagram/dog.png'),
  3 : EnneagramType(3,'독수리','assets/images/enneagram/eagle.png'),
  4 : EnneagramType(4,'고양이','assets/images/enneagram/cat.png'),
  5 : EnneagramType(5,'부엉이','assets/images/enneagram/owl.png'),
  6 : EnneagramType(6,'사슴','assets/images/enneagram/deer.png'),
  7 : EnneagramType(7,'원숭이','assets/images/enneagram/monkey.png'),
  8 : EnneagramType(8,'호랑이','assets/images/enneagram/tiger.png'),
  9 : EnneagramType(9,'코끼리','assets/images/enneagram/elephant.png'),
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