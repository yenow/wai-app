// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/all.dart';
//
// final stateName =
// ChangeNotifierProvider<DataType>((ref) => DataType());
//
// //ex
// final riverpodProvider =
// ChangeNotifierProvider<PersonProvider>((ref) => PersonProvider());
//
//
// class Person {
//   final name;
//   final socialNumber;
//   Person({this.name, this.socialNumber});
// }
//
// class PersonProvider with ChangeNotifier {
//   final _personList = <Person>[];
//   final _dropDownList = [];
//
//   //bool type의 Fetch를 이용하여 데이터를 가져오는 중인지 체크한다.
//   bool _isFetch = false;
//
//   get isFetching => _isFetch;
//
//   get getData => _personList;
//
//   fetchData() async {
//     if (_isFetch) return;
//
//     _isFetch = true;
//     _personList.clear();
//
//     try {
//       //Realtime Database에 있는 person Key-Value형식의 데이터를 가지고 옴.
//       DataSnapshot dataSnapshot =
//       await FirebaseDatabase.instance.reference().child("person").once();
//
//       //Iterable에서 Map으로 변경한다.
//       Map<String, dynamic> personMap =
//       Map<String, dynamic>.from(dataSnapshot.value);
//
//       //Person socialNumber(key)와 name(value)를 저장한다.
//       personMap.forEach((keySocialNumber, valueName) {
//         _personList.add(
//             new Person(socialNumber: keySocialNumber, name: valueName));
//       });
//
//
//       //모든것이 완료되면 notifyListeners를 이용하여 연결되어있는 위젯을 업데이트 시켜준다.
//       //setState와 비슷하다고 생각하면 된다.
//       //만약 상태는 변경되었지만 notifyListeneres를 호출하지 않으면 위젯은 업데이트되지않는다.
//       notifyListeners();
//
//     } catch (error) {
//       //에러가 발생하는 경우.
//       print("ERROR fetchData in PersonProvider.dart : $error");
//
//     } finally {
//       //모든 작업이 끝나면 fetch가 false로 반환이 되게 한다.
//       _isFetch = false;
//     }
//   }
// }
//
// class PersonWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     //watch는 Provider를 관찰하는 역할
//     //watch된 Provider에서 notifyListener()가 작동하는지 확인한다.
//     final watchProvider = watch(riverpodProvider);
//
//     if (watchProvider.isFetching) {
//       //Provider에서 isFetch가 true인 경우 데이터를 가져오는 중
//       return Center(
//         child: CupertinoActivityIndicator(),
//       );
//     } else {
//       //Provider에서 isFetch가 false인 경우 widget을 띄운다.
//       return Container();
//     }
//   }
// }