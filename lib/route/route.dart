import 'package:get/get.dart';
import 'package:wai/binding/wai_splash_binding.dart';
import 'package:wai/binding/introduction_binding.dart';
import 'package:wai/binding/sign_up_binding.dart';
import 'package:wai/main.dart';
import 'package:wai/screens/splash_screen.dart';
import 'package:wai/ui/introduce_screen/introduction_screen.dart';
import 'package:wai/ui/introduce_screen/widget/introduction_page_view.dart';
import 'package:wai/ui/sign_up_screen/sign_up_screen.dart';
import 'package:wai/ui/wai_splash_screen.dart';

abstract class Routes{
  // static const initial = "/";
  static const splash = "/splash";
  static const introduction = "/introduction";
  static const signUp = "/signUp";
}
class AppPages {

  static final routes = [
    // GetPage(name: Routes.initial, page:() => const WaiSplashScreen(), binding: WaiSplashBinding()),
    GetPage(name: Routes.splash, page:()=> const WaiSplashScreen(),),
    GetPage(name: Routes.introduction, page:()=> const IntroductionScreen(), binding: IntroductionBinding()),
    GetPage(name: Routes.signUp, page:()=> const SignUpScreen(), binding: SignUpBinding()),
  ];
}