import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/post/post_controller.dart';
import 'package:wai/data/model/post/post.dart';

import 'components/post_page.dart';

class PostScreen extends GetView<PostController> {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // logger.d(Get.arguments);
    // Post post = Get.arguments;
    String? postId = Get.parameters['postId'];
    if (postId == null) {
      Get.back();
    }

    return FutureBuilder(
      future: controller.getPost(postId!),
      builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
        if (snapshot.hasData) {
          return PostPage(post: snapshot.data!);

        } else if (snapshot.hasError) {
          return Text('error');

        } else {
          return const Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
          );
        }
      }
    );
  }
}
