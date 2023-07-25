import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  void updatIndex(int index) {
    tabIndex = index;
    update();
  }
}
