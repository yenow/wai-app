import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/models/post_item.dart';
import 'package:wai/screens/posts_page/components/post.dart';

class PostPageScreen extends StatelessWidget {
  const PostPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5,),
        itemCount: postItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Post(postItem: postItems.elementAt(index));
        },
      )
    );
  }
}

