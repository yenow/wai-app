class AppbarState {
  double appbarSize;
  String appbarTitle;
  bool isPopPage;
  bool isBackgroundImage;

  AppbarState({
    this.appbarSize = 50,
    required this.appbarTitle,
    this.isPopPage = false,
    this.isBackgroundImage = true
  });

  updateIsPopPage() {
    isPopPage = !isPopPage;
  }
}