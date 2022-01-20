import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/models/post.dart';
import 'package:wai/screens/posts_page/components/post_item.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/posts_page/post_write_page.dart';

class PostsPageScreen extends StatelessWidget {
  const PostsPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          MainController.to.setIsPopPage(true);
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostWritePage()));
        },
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5,),
          itemCount: dummyPosts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostItem(
              post: dummyPosts.elementAt(index),
              onTap: () {
                MainController.to.setIsPopPage(true);
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostPageScreen(postId: dummyPosts.elementAt(index).postId,)));
              }
            );
          },
        )
      ),
    );
  }
}

