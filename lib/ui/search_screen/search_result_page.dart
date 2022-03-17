import 'package:flutter/cupertino.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key, required this.searchText}) : super(key: key);
  final String searchText;

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {

  Future<bool> getSearchResult() async {

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getSearchResult(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return Container();
      }
    );
  }
}
