import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/post_controller.dart';
import 'package:wai/controller/search_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/toast.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/ui/search_screen/search_result_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  String searchText = "";
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FocusOutContainer(
        child: Scaffold(
          appBar: WaiAppbar(
              flexibleSpace: _buildForm(),
              isBackLeading: true,
              actions: [
                IconButton(
                  icon: const Icon(
                      Icons.search_outlined, size: 24, color: WaiColors.grey),
                  onPressed: () async {
                    _formKey.currentState!.save();
                    if (searchText.isEmpty) {
                      showToast("검색할 키워드를 입력해주세요.");
                    } else {

                      SearchController.to.initSearchPost();
                      SearchController.to.addRecentlySearchList(searchText);
                      // await searchPosts(searchText).then((value) {
                      //   setState(() {
                      //     isSearch = true;
                      //   });
                      // });
                    }
                  },
                )
              ]
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Form(
        key: _formKey,
        child: TextFormField(
            maxLength: 100,
            maxLines: null,
            expands: true,
            autofocus: true,
            onSaved: (value) {
              setState(() {
                searchText = value!;
              });
            },
            cursorColor: Colors.grey,
            style: WaiTextStyle(fontSize: 18, color: Colors.black54).basic(),
            decoration: InputDecoration(
                labelText: "검색할 내용을 입력해주세요.",
                labelStyle: WaiTextStyle(fontSize: 16, color: Colors.grey)
                    .basic(),
                floatingLabelStyle: WaiTextStyle(
                    fontSize: 16, color: Colors.grey).basic(),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                counterText: '',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none
            )
        ),
      ),
    );
  }


  Widget _buildBody() => isSearch ? _buildTab() : Container();

  Widget _buildTab() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          _buildTabBarContainer(),
          _buildTabBarView(),
        ],
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
            child: Center(child: Text('게시글', style: WaiTextStyle().tabBar()))
        ),
        SizedBox(
            height: 40,
            child: Center(child: Text('제목', style: WaiTextStyle().tabBar()))
        ),
        SizedBox(
            height: 40,
            child: Center(child: Text('작성자', style: WaiTextStyle().tabBar()))
        ),
      ],
    );
  }

  Expanded _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          // _buildSearchPostsByContent(),
          // _buildSearchPostsByTitle(),
          // _buildSearchPostsByAuthor(),
        ],
      ),
    );
  }

  // Widget _buildSearchPostsByContent() =>
  //     PostItems(
  //       posts: SearchController.to.searchPostsByContent,
  //       postRequestDto: PostRequestDto(
  //         postsCount: PostController.to.postsCount,
  //         postSearchType: PostSearchType.content,
  //         searchText: searchText
  //       ),
  //       getNewPostsFunction: readMoreNewPosts,
  //       getOldPostsFunction: readMoreOldPosts,
  //     );
  //
  // Widget _buildSearchPostsByTitle() =>
  //     PostItems(
  //       posts: SearchController.to.searchPostsByTitle,
  //       postRequestDto: PostRequestDto(
  //         postsCount: PostController.to.postsCount,
  //         postSearchType: PostSearchType.title,
  //         searchText: searchText
  //       ),
  //       getNewPostsFunction: readMoreNewPosts,
  //       getOldPostsFunction: readMoreOldPosts,
  //     );
  //
  // Widget _buildSearchPostsByAuthor() =>
  //     PostItems(
  //       posts: SearchController.to.searchPostsByAuthor,
  //       postRequestDto: PostRequestDto(
  //         postsCount: PostController.to.postsCount,
  //         postSearchType: PostSearchType.author,
  //         searchText: searchText
  //       ),
  //       getNewPostsFunction: readMoreNewPosts,
  //       getOldPostsFunction: readMoreOldPosts,
  //     );
}
