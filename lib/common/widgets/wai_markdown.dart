import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:wai/common/theme/wai_textstyle.dart';

class WaiMarkdown extends StatefulWidget {
  const WaiMarkdown({Key? key, required this.url}) : super(key: key);
  final String url;

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
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            data: snapshot.data!,
            styleSheet: MarkdownStyleSheet(
              h1: WaiTextStyle().headline1(),
              h2: WaiTextStyle().headline2(),
              h3: WaiTextStyle().headline2(),
              h4: WaiTextStyle(fontSize: 18).headline2(),
              p: WaiTextStyle(fontSize: 16).bodyText(),
              code: WaiTextStyle(fontSize: 16).code(),
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
