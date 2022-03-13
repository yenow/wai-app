import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/constants/wai_colors.dart';

class WaiMarkdown extends StatefulWidget {
  const WaiMarkdown({Key? key, required this.url, this.scrollPhysics, this.scrollController, this.shrinkWrap}) : super(key: key);
  final String url;
  final bool? shrinkWrap;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;

  @override
  _WaiMarkdownState createState() => _WaiMarkdownState();
}

class _WaiMarkdownState extends State<WaiMarkdown> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString(widget.url), //  assets/markdown/practice.md
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            shrinkWrap: widget.shrinkWrap ?? true,
            controller: widget.scrollController,
            physics: widget.scrollPhysics ?? const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            data: snapshot.data!,
            styleSheet: MarkdownStyleSheet(
              h1: const TextStyle(fontSize: 40, color: WaiColors.black50),
              h2: const TextStyle(fontSize: 30, color: WaiColors.black50),
              h2Padding: const EdgeInsets.symmetric(vertical: 10),
              h3: const TextStyle(fontSize: 25, color: WaiColors.black50),
              h4: const TextStyle(fontSize: 20, color: WaiColors.black50),
              h5: const TextStyle(fontSize: 18, color: WaiColors.black50),
              p: const TextStyle(fontSize: 16, color: WaiColors.black50),
              code:const TextStyle(fontSize: 16, color: WaiColors.black50),
              horizontalRuleDecoration: BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(width: 0.5, color: WaiColors.grey)
                  )
              ),
              blockquoteDecoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}


class WaiMarkdown2 extends StatelessWidget {
  const WaiMarkdown2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: "# 마크다운 "
          "## 마크다운 연습파일"
          "마크다운"
          "this is markdown",
      styleSheet: MarkdownStyleSheet(
        h1: WaiTextStyle().headline1(),
        h2: WaiTextStyle().headline2(),
        h3: WaiTextStyle(fontSize: 18).headline2(),
        h4: WaiTextStyle(fontSize: 18).headline2(),
        blockquoteDecoration: const BoxDecoration(
            color: Colors.grey
        ),
      ),
    );
  }
}
