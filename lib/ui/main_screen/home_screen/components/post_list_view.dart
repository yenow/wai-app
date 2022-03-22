import 'package:flutter/material.dart';
import 'package:wai/data/model/post/post_request_dto.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_list.dart';

import '../../../../data/model/post/post.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    Key? key,
    required this.posts,
    this.postRequestDto,
    this.getNewPostsFunction,
    this.getOldPostsFunction
  }) : super(key: key);

  final List<Post> posts;   //  PostController.to.posts
  final PostRequestDto? postRequestDto;
  final Future<List<Post>> Function(List<Post>, PostRequestDto)? getNewPostsFunction;
  final Future<List<Post>> Function(List<Post>, PostRequestDto, void Function(List<Post>))? getOldPostsFunction;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        // key: _scaffoldKey,
        padding: EdgeInsets.zero,
        itemCount: posts.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return PostList(key: UniqueKey(), post: posts.elementAt(index));
        },
      ),
    );
  }
}
