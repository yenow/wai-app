import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/screens/posts_page/components/post.dart';

class PostPageScreen extends StatelessWidget {
  const PostPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
             Post()
          ],
        ),
      )
    );
  }
}

