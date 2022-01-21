class WritePost {
  String? title;
  String? content;

  @override
  String toString() {
    return 'WritePost{title: $title, content: $content}';
  }

  bool isValidTitle () {

    if (title == null || title!.trim() == "") {
      return false;
    } else {
      return true;
    }
  }

  bool isValidContent () {

    if (content == null || content!.trim() == "") {
      return false;
    } else {
      return true;
    }
  }
}
