import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/screens/personality_test_page/personality_test_page_screen.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/profile_page/profile_page_screen.dart';
import 'package:wai/screens/search_page/search_page_screen.dart';
import 'package:wai/screens/write_page/write_page_screen.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  // #1#
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'wai',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Container(
            color: Colors.red[100],
            child: const Center(
              child: PostPageScreen(),
            ),
          ),
          Container(
            color: Colors.orange[100],
            child: const Center(
              child: PersonalityTestPageScreen(),
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: const Center(
              child: WritePageScreen(),
            ),
          ),
          Container(
            color: Colors.green[100],
            child: const Center(
              child: SearchPageScreen(),
            ),
          ),
          Container(
            color: Colors.blue[100],
            child: const Center(
              child: ProfilePageScreen(),
            ),
          )
        ],
      ),
      // 4
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: '홈',
              icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: '테스트',
            icon: Icon(CupertinoIcons.square_list),
          ),
          BottomNavigationBarItem(
            label: '글쓰기',
            icon: Icon(CupertinoIcons.add),
          ),
          BottomNavigationBarItem(
            label: '검색',
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            label: '프로필',
            icon: Icon(CupertinoIcons.profile_circled),
          )
        ],
      ),
    );
  }
}
