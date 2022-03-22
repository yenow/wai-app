import 'package:flutter/material.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_list_view.dart';

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        PostListView(
          posts: dummyPosts,
          postRequestDto: null,
          getNewPostsFunction: null,
          getOldPostsFunction: null,
        ),
        Container(),
        Container(),
      ],
    );
  }
}
