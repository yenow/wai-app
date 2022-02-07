import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/screens/search_page/search_result_page.dart';

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
            //title: _buildForm(),
            flexibleSpace: _buildForm(),
            isBackLeading: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search_outlined, size: 24, color: WaiColors.grey),
                onPressed: () {
                  _formKey.currentState!.save();
                  if (searchText.isEmpty) {

                    Fluttertoast.showToast(
                      msg: "검색할 키워드를 입력해주세요.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      backgroundColor: WaiColors.grey.shade200,
                      textColor: WaiColors.lightBlack,
                    );
                  } else {
                    setState(() {
                      isSearch = true;
                    });
                    // Get.to(() => SearchResultPage(searchText: searchText));

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

  Expanded _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          Container(),
          Container(),
          Container(),
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

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Form(
        key: _formKey,
        child: TextFormField(
          maxLength: 100,
          maxLines : null,
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
              labelStyle: WaiTextStyle(fontSize: 16, color: Colors.grey).basic(),
              floatingLabelStyle: WaiTextStyle(fontSize: 16, color: Colors.grey).basic(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              counterText: '',
              border: InputBorder.none,
              enabledBorder: InputBorder.none ,
              focusedBorder: InputBorder.none ,
              focusedErrorBorder: InputBorder.none
          )
        ),
      ),
    );
  }
}
