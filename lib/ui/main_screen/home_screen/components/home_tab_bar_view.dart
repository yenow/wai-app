import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wai/controller/post/all_post_controller.dart';
import 'package:wai/controller/post/my_enneagram_post_controller.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_list_view.dart';

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        PostListView(
          posts: AllPostController.to.posts,
          onRefresh: AllPostController.to.onRefresh,
          scrollController: AllPostController.to.scrollController,
        ),
        PostListView(
          posts: AllPostController.to.posts,
          onRefresh: AllPostController.to.onRefresh,
          scrollController: AllPostController.to.scrollController,
        ),
        PostListView(
          posts: MyEnneagramPostController.to.posts,
          onRefresh: MyEnneagramPostController.to.onRefresh,
          scrollController: MyEnneagramPostController.to.scrollController,
        ),
      ],
    );
  }
}
