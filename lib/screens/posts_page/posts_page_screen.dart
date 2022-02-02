import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/constants/custom_colors.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/screens/posts_page/components/post_item.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/posts_page/post_write_page.dart';
import 'package:wai/widgets/custom_appbar.dart';
import 'package:wai/widgets/horizontal_border_line.dart';

import 'components/post_item_list_type.dart';

class PostsPageScreen extends StatelessWidget {
  const PostsPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppbar(context),
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

  PreferredSize _buildAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        title: Text("게시글"),
        elevation: 2.0,
        backgroundColor: Colors.white,
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
          _buildPosts(),
          _buildPopularPosts()
        ],
      ),
    );
  }

  Widget _buildPosts() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        scrollNotification(notification);
        return false;
      },
      child: RefreshIndicator(
        onRefresh: PostController.to.readMoreNewPosts,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Obx(() =>
            Scrollbar(
              thickness: 8,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const HorizontalBorderLine(height: 0.25,),
                itemCount: PostController.to.posts.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostItemListType(
                    post: PostController.to.posts.value.elementAt(index),
                    onTap: () {
                      Get.to(() => PostPageScreen(
                          postId: PostController.to.posts.value.elementAt(index).postId!)
                      );
                    }
                  );
                },
              ),
            ),
          )
        ),
      ),
    );
  }

  scrollNotification(notification) {
    // 스크롤 최대 범위
    var containerExtent = notification.metrics.viewportDimension;

    if (notification is ScrollStartNotification) {
      // 스크롤을 시작하면 발생(손가락으로 리스트를 누르고 움직이려고 할때)
      // 스크롤 거리값을 0으로 초기화함
      PostController.to.dragDistance.value = 0;
    } else if (notification is OverscrollNotification) {
      // 안드로이드에서 동작
      // 스크롤을 시작후 움직일때 발생(손가락으로 리스트를 누르고 움직이고 있을때 계속 발생)
      // 스크롤 움직인 만큼 빼준다.(notification.overscroll)
      PostController.to.dragDistance.value -= notification.overscroll;
    } else if (notification is ScrollUpdateNotification) {
      // ios에서 동작
      // 스크롤을 시작후 움직일때 발생(손가락으로 리스트를 누르고 움직이고 있을때 계속 발생)
      // 스크롤 움직인 만큼 빼준다.(notification.scrollDelta)
      PostController.to.dragDistance.value -= notification.scrollDelta!;
    } else if (notification is ScrollEndNotification) {
      // 스크롤이 끝났을때 발생(손가락을 리스트에서 움직이다가 뗐을때 발생)

      // 지금까지 움직인 거리를 최대 거리로 나눈다.
      var percent = PostController.to.dragDistance.value / (containerExtent);
      // 해당 값이 -0.4(40프로 이상) 아래서 위로 움직였다면
      if (percent <= -0.4) {
        // maxScrollExtent는 리스트 가장 아래 위치 값
        // pixels는 현재 위치 값
        // 두 같이 같다면(스크롤이 가장 아래에 있다)
        if (notification.metrics.maxScrollExtent ==
            notification.metrics.pixels) {

          PostController.to.setIsMoreRequesting(true);

          // 서버에서 데이터 가져온다
          PostController.to.readMoreOldPosts().then((value) {

            // 다 가져오면 하단 표시 서클 제거
            PostController.to.setIsMoreRequesting(false);
          });
        }
      }
    }
  }

  Container _buildPopularPosts() {
    return Container(
      child: Text("게시글"),
    );
  }
}

