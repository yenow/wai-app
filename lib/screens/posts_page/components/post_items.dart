import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/screens/posts_page/components/post_item.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

import '../post_page_screen.dart';

class PostItems extends StatefulWidget {
  const PostItems({Key? key}) : super(key: key);

  @override
  _PostItemsState createState() => _PostItemsState();
}

class _PostItemsState extends State<PostItems> {

  void rebuildMethod() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // loggerNoStack.i("PostItems build");

    return Obx(() =>
      RefreshIndicator(
        onRefresh: PostController.to.readMoreNewPosts,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Scrollbar(
              thickness: 8,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const HorizontalBorderLine(height: 0.25,),
                itemCount: PostController.to.posts.length,
                itemBuilder: (BuildContext context, int index) {

                  return PostItem(post: PostController.to.posts.elementAt(index));
                },
              ),
            )
        ),
      ),
    );
  }
}
