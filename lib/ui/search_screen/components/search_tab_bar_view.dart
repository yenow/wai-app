import 'package:flutter/material.dart';

class SearchTabBarView extends StatelessWidget {
  const SearchTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          Container(),
          Container(),
          Container(),
          // _buildSearchPostsByContent(),
          // _buildSearchPostsByTitle(),
          // _buildSearchPostsByAuthor(),
        ],
      ),
    );
  }
}
