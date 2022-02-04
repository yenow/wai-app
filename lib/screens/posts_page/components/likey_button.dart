import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/widgets/black.dart';

class LikeyButton extends StatefulWidget {
  const LikeyButton({Key? key, required this.isLikey,required this.likeyCount, required this.onPressed}) : super(key: key);
  final bool isLikey;
  final int likeyCount;
  final VoidCallback onPressed;

  @override
  _LikeyButtonState createState() => _LikeyButtonState();
}

class _LikeyButtonState extends State<LikeyButton> {

  @override
  Widget build(BuildContext context) {

    return IconButton(
      icon: Row(
        children: [
          _buildIcon(),
          const Blank(width: 5),
          Text(widget.likeyCount.toString(), style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black45)),
        ],
      ),
      iconSize: 18,
      padding: EdgeInsets.zero,
      onPressed: () {
        widget.onPressed();
      },
    );
  }

  Widget _buildIcon() {

    if (widget.isLikey) {
      return const Icon(Icons.favorite_outlined, size: 18, color: Colors.black45 );
    } else {
      return const Icon(Icons.favorite_border_outlined, size: 18, color: Colors.black45 );
    }
  }
}

//
// class LikeyButton extends StatelessWidget {
//   const LikeyButton({Key? key, required this.isLikey,required this.likeyCount, required this.onPressed}) : super(key: key);
//   final bool isLikey;
//   final int likeyCount;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return IconButton(
//       icon: Row(
//         children: [
//           _buildIcon(),
//           const Blank(width: 5),
//           Text(likeyCount.toString(), style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black45)),
//         ],
//       ),
//       iconSize: 18,
//       padding: EdgeInsets.zero,
//       onPressed: onPressed,
//     );
//   }
//
//   Widget _buildIcon() {
//
//     if (isLikey) {
//       return const Icon(Icons.favorite_border, size: 18, color: Colors.black45 );
//     } else {
//       return const Icon(Icons.favorite_border_outlined, size: 18, color: Colors.black45 );
//     }
//   }
// }
