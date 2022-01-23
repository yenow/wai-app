class PostSaveRequestDto {
  String _userId = "";
  String _userKey = "";
  String _title = "";
  String _content = "";

  Map<String, dynamic> toJson () {
    return {
      "userId" : _userId,
      "userKey" : _userKey,
      "title" : _title,
      "content" : _content,
    };
  }

  bool isValidTitle () {

    if (_title == null || _title.trim() == "") {
      return false;
    } else {
      return true;
    }
  }

  bool isValidContent () {

    if (_content == null || _content.trim() == "") {
      return false;
    } else {
      return true;
    }
  }

  /* getter and setter */

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  String get userKey => _userKey;

  set userKey(String value) {
    _userKey = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }
}