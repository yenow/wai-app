

import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/controller/search_controller.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/net/post/post_api.dart';

Future<void> searchPosts(String searchText) async {

  await initPosts(
      SearchController.to.searchPostsByTitle,
      PostRequestDto(
        postsCount: PostController.to.postsCount,
        postSearchType: PostSearchType.title,
        searchText: searchText
      )
  );

  await initPosts(
      SearchController.to.searchPostsByContent,
      PostRequestDto(
          postsCount: PostController.to.postsCount,
          postSearchType: PostSearchType.content,
          searchText: searchText
      )
  );

  await initPosts(
      SearchController.to.searchPostsByAuthor,
      PostRequestDto(
          postsCount: PostController.to.postsCount,
          postSearchType: PostSearchType.author,
          searchText: searchText
      )
  );

}