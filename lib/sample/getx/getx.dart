//controller 상태관리 이후 brodcast 방법
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class CounterController extends GetxController{
//   int count=0;
//   void increment(){
//     count++;
//     update();
//   }
// }
//변경된 상태값을 전달받는 ui 쪽 소스
// Getbuilder<CounterController>(
// builder: (controller) {
// return Text( '${controller.count}');
// }
// )

final count = 0.obs;

//controller 상태관리 이후 brodcast 방법
class CounterController extends GetxController{
  RxInt count=0.obs;
  void increment(){
    count++;
  }
}

//변경된 상태값을 전달받는 ui 쪽 소스
// Obx(()=> Text( '${controller.count}'))