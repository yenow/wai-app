// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MainScreen(),
//     );
//   }
// }
//
// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//
//   List<Widget> _widgetOptions = <Widget>[
//     HomePage(),
//     CalendarPage(),
//     ProfilePage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Feather.home,
//               color: kGoodLightGray,
//             ),
//             title: Text('HOME'),
//             activeIcon: Icon(
//               Feather.home,
//               color: kGoodPurple,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               FontAwesome.calendar,
//               color: kGoodLightGray,
//             ),
//             title: Text('CALENDAR'),
//             activeIcon: Icon(
//               FontAwesome.calendar,
//               color: kGoodPurple,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               EvilIcons.user,
//               color: kGoodLightGray,
//               size: 36,
//             ),
//             title: Text('PROFILE'),
//             activeIcon: Icon(
//               EvilIcons.user,
//               color: kGoodPurple,
//               size: 36,
//             ),
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//       body: _widgetOptions.elementAt(_selectedIndex),
//     );
//   }
//
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.lightBlueAccent,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Container(
//             child: Text(
//               'Screen 1',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20
//               ),
//             ),
//             margin: EdgeInsets.all(16),
//           ),
//           FlatButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(
//                   builder: (context) => Screen2()
//               ));
//             },
//             child: Text('Go to next screen'),
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CalendarPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Center(
//         child: FlatButton(
//           onPressed: (){
//             Navigator.push(context, MaterialPageRoute(
//                 builder: (context) => Screen2()
//             ));
//           },
//           child: Text('Go to next screen'),
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
//
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.lightGreenAccent,
//     );
//   }
// }
//
// class Screen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.lightBlueAccent,
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               child: Text(
//                 'Screen 2',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20
//                 ),
//               ),
//               margin: EdgeInsets.all(16),
//             ),
//             FlatButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Go back'),
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }