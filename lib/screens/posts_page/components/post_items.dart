import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/screens/posts_page/components/post_item.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

import '../post_page_screen.dart';

class PostItems extends StatefulWidget {
  const PostItems({
    Key? key,
    required this.posts,
    required this.postRequestDto,
    required this.getNewPostsFunction,
    required this.getOldPostsFunction,
  }) : super(key: key);
  final List<Post> posts;   //  PostController.to.posts
  final PostRequestDto postRequestDto;
  final Future<List<Post>> Function(List<Post>, PostRequestDto) getNewPostsFunction;
  final Future<List<Post>> Function(List<Post>, PostRequestDto, void Function(List<Post>)) getOldPostsFunction;

  @override
  _PostItemsState createState() => _PostItemsState();
}

class _PostItemsState extends State<PostItems> {
  List<Post> posts = [];

  bool isMoreRequesting = false;
  int nextPage = 0;   //다음 데이터 위치를 파악하기 위함
  double _dragDistance = 0; // 드레그 거리를 체크하기 위함  // 해당 값을 평균내서 50%이상 움직였을때 데이터 불러오는 작업을 하게됨.

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    posts = widget.posts;
    super.initState();
  }

  void rebuildMethod() {
    setState(() {});
  }

  void addNewPostToList(List<Post> newPosts){
    setState(() {
      for (Post post in newPosts) {
        posts.insert(0, post);
      }
    });
  }

  void addOldPostToList(List<Post> newPosts){
    setState(() {
      for (Post post in newPosts) {
        posts.add(post);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    if (posts.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(child: Text("게시글이 존재하지 않습니다.", style: WaiTextStyle(fontSize: 18, color: Colors.black54).basic(),)),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        scrollNotification(notification);
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          List<Post> newPosts = await widget.getNewPostsFunction(widget.posts, widget.postRequestDto);
          addNewPostToList(newPosts);
        },    // PostController.to.readMoreNewPosts
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Scrollbar(
              showTrackOnHover: true,
              thickness: 2.0,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      key: _scaffoldKey,
                      separatorBuilder: (BuildContext context, int index) => const HorizontalBorderLine(height: 0.25,),
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {

                        return PostItem(post: posts.elementAt(index));
                      },
                    ),
                  ),
                  // Container(
                  //   height: isMoreRequesting ? 50.0 : 0,
                  //   color: Colors.white,
                  //   child: const Center(
                  //     child: CircularProgressIndicator(),
                  //   ),
                  // ),
                ],
              ),
            )
        ),
      ),
    );
  }

  scrollNotification(notification) {
    var containerExtent = notification.metrics.viewportDimension;

    if (notification is ScrollStartNotification) {
      _dragDistance = 0;

    } else if (notification is OverscrollNotification) {
      _dragDistance -= notification.overscroll;

    } else if (notification is ScrollUpdateNotification) {
      _dragDistance -= notification.scrollDelta!;

    } else if (notification is ScrollEndNotification) {

      var percent = _dragDistance / (containerExtent);
      if (percent <= -0.4) {
        if (notification.metrics.maxScrollExtent ==
            notification.metrics.pixels) {

          setState(() {
            isMoreRequesting = true;
          });

          // 서버에서 데이터 가져온다.    List<Post> posts = await
          widget.getOldPostsFunction(posts, widget.postRequestDto, addOldPostToList).then((value) {
            setState(() {
              // 다 가져오면 하단 표시 서클 제거
              isMoreRequesting = false;
            });
          });
        }
      }
    }
  }
}
