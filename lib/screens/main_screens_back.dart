import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wai/screens/posts_page/posts_page_screen.dart';
import 'package:wai/screens/profile_page/profile_page_screen.dart';
import 'package:wai/screens/search_page/search_page_screen.dart';
import 'package:wai/screens/write_page/write_page_screen.dart';

import '../common/constants/constants.dart';
import 'enneagram_test_page/enneagram_test_page_screen.dart';

class MainScreens2 extends StatefulWidget {
  const MainScreens2({Key? key}) : super(key: key);

  @override
  _MainScreens2State createState() => _MainScreens2State();
}

class _MainScreens2State extends State<MainScreens2> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text(
          'WAI',
        ),
        flexibleSpace: Image(
          image: new AssetImage("assets/images/background/night-4822906.png"),
          fit: BoxFit.cover,
        ),
        // backgroundColor: Colors.black,
        leading: IconButton(
            icon: const Icon(
              FontAwesomeIcons.alignJustify,
              color: appBarTitleTextColor,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
           onPressed: () {
              print(1);
           },
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
            child: PostsPageScreen(),
            color: Color.fromRGBO(200, 200, 200, 0.3),
          ),
          Container(
            color: Colors.orange[100],
            child: Center(
              child: EnneagramTestPageScreen(),
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
