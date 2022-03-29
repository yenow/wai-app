import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/notice_client.dart';
import 'package:wai/data/model/notice/notice.dart';
import 'package:wai/data/model/notice/notice_request_dto.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';

class NoticeController extends GetxController {

  static NoticeController get to => Get.find();

  final notices = <Notice>[].obs;
  final isLoading = false.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {

    scrollController.addListener(() async {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100 && !isLoading.value) {
        await getNotices();
      }

    });
    super.onInit();
  }

  Future<void> getNotices() async {
    isLoading.value = true;

    await NoticeClient(mainDio).getNotices(
      noticeRequestDto: NoticeRequestDto(
        lastNoticeId: notices.isEmpty ? null : notices.elementAt(notices.lastIndexWhere((element) => true)).noticeId,
        maxNoticeSize: 20,
        recipientUserId: UserController.to.user.value.userId
      ),
      token: AppController.to.getJwtToken()
    ).then((value) {
      notices.addAll(value);
    });

    isLoading.value = false;
  }

  Future<void> onRefresh() async {
    notices([]);
    await getNotices();
  }

  void clearNotice(Notice notice) async {
    await NoticeClient(mainDio).clearNotice(
      noticeRequestDto: NoticeRequestDto(
        noticeId: notice.noticeId
      ),
      token: AppController.to.getJwtToken(),
    ).then((value) {
      notices[notices.indexWhere((element) => element.noticeId == value.noticeId)] = value;
    });
  }

  void clearAllNotice() async {
    await NoticeClient(mainDio).clearAllNotice(
      noticeRequestDto: NoticeRequestDto(
        recipientUserId: UserController.to.user.value.userId
      ),
      token: AppController.to.getJwtToken(),
    ).then((value) {
      notices([]);
    });
  }

  void goPage(Notice notice) {
    Get.toNamed(WaiRoutes.post + '/${notice.targetPostId}');
    // Get.toNamed(WaiRoutes.reply + '/${notice.targetPostId}');
  }
}