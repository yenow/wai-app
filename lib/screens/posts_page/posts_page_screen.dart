import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/controller/user_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/net/post/post_api.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/posts_page/post_write_page.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/custom_appbar.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

import 'components/post_item.dart';
import 'components/post_items.dart';

class PostsPageScreen extends StatefulWidget {
  const PostsPageScreen({Key? key}) : super(key: key);

  @override
  _PostsPageScreenState createState() => _PostsPageScreenState();
}

class _PostsPageScreenState extends State<PostsPageScreen>
  with AutomaticKeepAliveClientMixin<PostsPageScreen>{

  @override
  bool get wantKeepAlive => true;

  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const WaiAppbar(
          title: Text("게시글"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.post_add_outlined),
          backgroundColor: Colors.blueGrey,
          onPressed: () async {

            WidgetsBinding.instance!.addPostFrameCallback((_) async {
              await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PostWritePage()),
              );

              List<Post> posts = await readMoreNewPosts(
                  PostController.to.posts, PostRequestDto(postsCount: PostController.to.postsCount, postSearchType: PostSearchType.all)
              );
              for (Post post in posts) {
                PostController.to.posts.insert(0, post);
              }
              rebuild();
            });
            // Get.to(() => const PostWritePage());
          },
        ),
        body: Column(
          children: [
            _buildTabBarContainer(),
            _buildTabBarView(),
          ],
        ),
      ),
    );
  }

  Container _buildTabBarContainer() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      child: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    int enneagramType = UserController.to.user.value.myEnneagramType!;

    return TabBar(
      indicatorColor: lightBlueGrey,
      tabs: <Widget>[
        SizedBox(
          height: 40,
          child: Center(child: Text('전체글', style: CustomTextStyles.buildTextStyle(fontSize: 15, color: lightBlueGrey)))
        ),
        SizedBox(
          height: 40,
          child: Center(child: Text('인기글', style: CustomTextStyles.buildTextStyle(fontSize: 15, color: lightBlueGrey)))
        ),
        SizedBox(
            height: 40,
            child: Center(child: Text('$enneagramType유형', style: CustomTextStyles.buildTextStyle(fontSize: 15, color: lightBlueGrey)))
        ),
      ],
    );
  }

  Expanded _buildTabBarView() {
    return Expanded(
      child: Obx(()=>
        TabBarView(
          children: [
            _buildAllPosts(),
            _buildPopularPosts(),
            _buildMyEnneagramTypePosts()
          ],
        ),
      ),
    );
  }

  Widget _buildAllPosts() {
    return PostItems(
      posts: PostController.to.posts,
      getNewPostsFunction: readMoreNewPosts,
      getOldPostsFunction: readMoreOldPosts,
      postRequestDto: PostRequestDto(
          postsCount: PostController.to.postsCount,
          postSearchType: PostSearchType.all
      ),
    );
  }

  Widget _buildPopularPosts() {
    return PostItems(
      posts: PostController.to.popularPosts,
      getNewPostsFunction: readMoreNewPosts,
      getOldPostsFunction: readMoreOldPosts,
      postRequestDto: PostRequestDto(
          postsCount: PostController.to.postsCount,
          postSearchType: PostSearchType.popular
      ),
    );
  }

  Widget _buildMyEnneagramTypePosts() {
    return PostItems(
      posts: PostController.to.myEnneagramPosts,
      getNewPostsFunction: readMoreNewPosts,
      getOldPostsFunction: readMoreOldPosts,
      postRequestDto: PostRequestDto(
          postsCount: PostController.to.postsCount,
          postSearchType: PostSearchType.enneagramType,
          myEnneagramType: UserController.to.user.value.myEnneagramType
      ),
    );
  }

}

