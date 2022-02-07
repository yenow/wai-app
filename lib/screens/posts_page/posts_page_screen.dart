import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/net/post/post_api.dart';
import 'package:wai/screens/posts_page/components/post_item_back.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/posts_page/post_write_page.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/custom_appbar.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

import 'components/post_item.dart';
import 'components/post_items.dart';

class PostsPageScreen extends StatelessWidget {
  const PostsPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const WaiAppbar(
          title: Text("게시글"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            Get.to(() => PostWritePage());
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
      ],
    );
  }

  Expanded _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          _buildAllPosts(),
          _buildPopularPosts()
        ],
      ),
    );
  }

  Widget _buildAllPosts() {
    return PostItems(
      posts: PostController.to.posts,
      postRequestDto: PostRequestDto(postsCount: PostController.to.postsCount, postSearchType: PostSearchType.all),
      getNewPostsFunction: readMoreNewPosts,
      getOldPostsFunction: readMoreOldPosts,
    );
  }

  Widget _buildPopularPosts() {
    return PostItems(
      posts: PostController.to.popularPosts,
      postRequestDto: PostRequestDto(postsCount: PostController.to.postsCount, postSearchType: PostSearchType.popular),
      getNewPostsFunction: readMoreNewPosts,
      getOldPostsFunction: readMoreOldPosts,
    );
  }
}

