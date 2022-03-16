import 'package:get/get.dart';
import 'package:wai/binding/enneagram_type_binding.dart';
import 'package:wai/binding/hard_enneagram_test_binding.dart';
import 'package:wai/binding/introduction_binding.dart';
import 'package:wai/binding/main_binding.dart';
import 'package:wai/binding/post_write_binding.dart';
import 'package:wai/binding/service_agree_binding.dart';
import 'package:wai/binding/sign_up_binding.dart';
import 'package:wai/binding/simple_enneagram_test_binding.dart';
import 'package:wai/binding/who_am_i_binding.dart';
import 'package:wai/main.dart';
import 'package:wai/ui/enneagram_screen/enneagram_type_screen.dart';
import 'package:wai/ui/hard_enneagram_test_screen/hard_enneagram_test_screen.dart';
import 'package:wai/ui/main_screen/main_screens.dart';
import 'package:wai/ui/post_write_screen/post_write_screen.dart';
import 'package:wai/ui/service_agree_screen/service_agree_screen.dart';
import 'package:wai/ui/simple_enneagram_test_screen/simple_enneagram_test_page_screen.dart';
import 'package:wai/screens/splash_screen.dart';
import 'package:wai/ui/introduce_screen/introduction_screen.dart';
import 'package:wai/ui/sign_up_screen/sign_up_screen.dart';
import 'package:wai/ui/wai_splash_screen/wai_splash_screen.dart';
import 'package:wai/ui/who_am_i_screen/who_am_i_screen.dart';

abstract class WaiRoutes{
  static const initial = "/";
  static const serviceAgree = "/serviceAgree";
  static const introduction = "/introduction";
  static const signUp = "/signUp";
  static const whoAmI = "/whoAmI";
  static const simpleTest = "/simpleTest";
  static const hardTest = "/hardTest";
  static const main = "/main";
  static const enneagramType = "/enneagramType";
  static const postWrite = "/postWrite";
}
class AppPages {

  static final routes = [
    GetPage(name: WaiRoutes.initial, page:() => const WaiSplashScreen()),
    GetPage(name: WaiRoutes.serviceAgree, page:()=> const ServiceAgreeScreen(), binding: ServiceAgreeBinding()),
    GetPage(name: WaiRoutes.introduction, page:()=> const IntroductionScreen(), binding: IntroductionBinding()),
    GetPage(name: WaiRoutes.signUp, page:()=> const SignUpScreen(), binding: SignUpBinding()),
    GetPage(name: WaiRoutes.whoAmI, page:()=> const WhoAmIScreen(), binding: WhoAmIBinding()),
    GetPage(name: WaiRoutes.simpleTest, page:()=> SimpleEnneagramTestScreen(), binding: SimpleEnneagramTestBinding(), transition: Transition.downToUp),
    GetPage(name: WaiRoutes.hardTest, page:()=> const HardEnneagramTestScreen(), binding: HardEnneagramTestBinding(), transition: Transition.downToUp),
    GetPage(name: WaiRoutes.main, page:()=> const MainScreens(), binding: MainBinding()),
    GetPage(name: WaiRoutes.enneagramType, page:()=> const EnneagramTypeScreen(), binding: EnneagramTypeBinding()),
    GetPage(name: WaiRoutes.postWrite, page:()=> const PostWriteScreen(), binding: PostWriteBinding(), transition: Transition.downToUp),
  ];
}