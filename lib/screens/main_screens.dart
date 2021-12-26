import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wai/screens/personality_test_page/personality_test_page_screen.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/profile_page/profile_page_screen.dart';
import 'package:wai/screens/search_page/search_page_screen.dart';
import 'package:wai/screens/write_page/write_page_screen.dart';

import '../common/constants/constants.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // BUtton
            InkWell(
              onTap: () {
                  print(1);
                },
              child: Icon(
                FontAwesomeIcons.alignJustify,
                color: appBarTitleTextColor,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            Text(
              'WAI',
            ),
            SizedBox(
              width: 24.0,
            )
          ],
        ),
        bottom: const PreferredSize(
            child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
            preferredSize: Size.fromHeight(0.5)
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Container(
            child: PostPageScreen(),
            color: Color.fromRGBO(200, 200, 200, 0.3),
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
              label: '게시글',
              icon: Icon(CupertinoIcons.book),
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
