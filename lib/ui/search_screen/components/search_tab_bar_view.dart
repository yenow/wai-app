import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/controller/search/search_post_controller.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_list_view.dart';

class SearchTabBarView extends StatelessWidget {
  const SearchTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        PostListView(
          posts: SearchPostController.to.searchPostsByTag,
          onRefresh: SearchPostController.to.onRefreshByTag
        ),
        PostListView(
            posts: SearchPostController.to.searchPostsByTitle,
            onRefresh: SearchPostController.to.onRefreshByTitle
        ),
        PostListView(
            posts: SearchPostController.to.searchPostsByAuthor,
            onRefresh: SearchPostController.to.onRefreshByAuthor
        ),
      ],
    );
  }
}
