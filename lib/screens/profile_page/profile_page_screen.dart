import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            child: Text('ProfilePageScreen'),
          ),
        ),
        ElevatedButton(
          child: Text('userKey delete'),
          onPressed: () {

          }
        )
      ],
    );
  }
}
