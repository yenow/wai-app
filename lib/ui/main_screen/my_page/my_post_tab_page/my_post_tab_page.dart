import 'package:flutter/material.dart';

import '../../../../controller/post/my_post_controller.dart';
import '../../home_screen/components/post_list_view.dart';

class MyPostTabPage extends StatelessWidget {
  const MyPostTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PostListView(
      posts: MyPostController.to.posts,
      onRefresh: MyPostController.to.onRefresh,
      scrollController: MyPostController.to.scrollController,
    );
  }
}
