import 'package:get/get.dart';
import 'package:world_clock_case/controller/dashboard_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
