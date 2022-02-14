import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/net/post/post_api.dart';
import 'package:wai/screens/posts_page/components/post_item.dart';
import 'package:wai/screens/posts_page/components/post_items.dart';
import 'package:wai/screens/reply_page/components/reply_item.dart';

class MyActionPage extends StatefulWidget {
  const MyActionPage({Key? key}) : super(key: key);

  @override
  _MyActionPageState createState() => _MyActionPageState();
}

class _MyActionPageState extends State<MyActionPage> {
  late Future<bool> _isInit;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldKey2 = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _isInit = initMyActionState();
    super.initState();
  }

  Future<bool> initMyActionState() async {
    await initPosts(
        UserProfileController.to.myPosts,
        PostRequestDto(
          postsCount: PostController.to.postsCount,
          postSearchType: PostSearchType.myPosts,
          userId: UserController.to.user.value.userId
        )
    );

    await initPosts(
        UserProfileController.to.myReplyPosts,
        PostRequestDto(
            postsCount: PostController.to.postsCount,
            postSearchType: PostSearchType.myReplyPosts,
            userId: UserController.to.user.value.userId
        )
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _isInit,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
          /* 요청을 기다리는중 */
            case ConnectionState.waiting:
              return const Scaffold(
                  body: Center(
                      child: CircularProgressIndicator()
                  )
              );
            default:
            /* 에러시 */
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return _buildBody();
              }
          }
        }
    );// _buildBody();
  }

  DefaultTabController _buildBody() {
    return DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: const WaiAppbar(
        title: Text("나의 활동"),
        isBackLeading: true,
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
      indicatorColor: WaiColors.lightBlueGrey,
      tabs: <Widget>[
        SizedBox(
            height: 40,
            child: Center(child: Text('게시글', style: WaiTextStyle(color: WaiColors.lightBlueGrey).basic()))
        ),
        SizedBox(
            height: 40,
            child: Center(child: Text('내가 댓글단 게시글', style: WaiTextStyle(color: WaiColors.lightBlueGrey).basic()))
        ),
      ],
    );
  }

  Expanded _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          PostItems(
            posts: UserProfileController.to.myPosts,
              getNewPostsFunction: readMoreNewPosts,
              getOldPostsFunction: readMoreOldPosts,
              postRequestDto: PostRequestDto(
                  userId: UserController.to.user.value.userId,
                  postsCount: PostController.to.postsCount,
                  postSearchType: PostSearchType.myPosts,
              ),
          ),
          PostItems(
            posts: UserProfileController.to.myReplyPosts,
            getNewPostsFunction: readMoreNewPosts,
            getOldPostsFunction: readMoreOldPosts,
            postRequestDto: PostRequestDto(
                userId: UserController.to.user.value.userId,
                postsCount: PostController.to.postsCount,
                postSearchType: PostSearchType.myReplyPosts,
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildMyPosts() {
    return ListView.separated(
      key: _scaffoldKey,
      physics: const AlwaysScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => const HorizontalBorderLine(height: 0.25,),
      itemCount: UserController.to.user.value.posts!.length,
      itemBuilder: (BuildContext context, int index) {
        return PostItem(
          key: UniqueKey(),
          post: UserController.to.user.value.posts!.elementAt(index));
      },
    );
  }

  ListView _buildMyReplys() {
    return ListView.separated(
      key: _scaffoldKey2,
      physics: const AlwaysScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => const HorizontalBorderLine(height: 0.25,),
      itemCount: UserController.to.user.value.replys!.length,
      itemBuilder: (BuildContext context, int index) {
        return PostItem(
            key: UniqueKey(),
            post: UserController.to.user.value.replys!.elementAt(index).post!);
        // return ReplyItem(
        //   key: UniqueKey(),
        //   reply: UserController.to.user.value.replys!.elementAt(index),
        //   isAction: false,);
      },
    );
  }
}
