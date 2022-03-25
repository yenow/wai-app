import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/post/all_post_controller.dart';
import 'package:wai/data/model/post/post_request_dto.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_list.dart';

import '../../../../data/model/post/post.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    Key? key,
    required this.posts,
    required this.onRefresh,
    this.scrollController,
  }) : super(key: key);

  final List<Post> posts;   //  PostController.to.posts
  final Future Function() onRefresh;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: const Center(child: Text('등록된 글이 없습니다.\n새로운 글을 작성해주세요!', style: TextStyle(fontSize: 20, color: WaiColors.white70),)),
      );
    }

    return Obx(() =>
      RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          controller: scrollController,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostList(key: UniqueKey(), posts: posts, post: posts.elementAt(index));
          },
        ),
      ),
    );
  }
}
