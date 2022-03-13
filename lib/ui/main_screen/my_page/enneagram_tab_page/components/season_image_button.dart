import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SeasonImageButton extends StatelessWidget {
  const SeasonImageButton({Key? key, required this.dateTime}) : super(key: key);
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    String imageUrl = _getImageUrl(dateTime.month);

    return ClipOval(
      child: SizedBox(
        height: 50,
        width: 50,
        child: ElevatedButton(
          child: Image.asset(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
          ),
          style: ElevatedButton.styleFrom(
            // primary: Colors.red,
            padding: EdgeInsets.zero,
            shape: const CircleBorder(side: BorderSide(width: 0)),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  String _getImageUrl(int month) {
    String imageUrl = '';
    switch(month) {
      case 3:
      case 4:
      case 5:
        imageUrl = "assets/images/icon/spring.png";
        break;
      case 6:
      case 7:
      case 8:
        imageUrl = "assets/images/icon/summer.png";
        break;
      case 9:
      case 10:
      case 11:
        imageUrl = "assets/images/icon/fall.png";
        break;
      case 12:
      case 1:
      case 2:
        imageUrl = "assets/images/icon/winter.png";
        break;
      default:
        imageUrl = "assets/images/icon/spring.png";
        break;
    }
    return imageUrl;
  }
}
