import 'package:get/get.dart';
import 'package:world_clock_case/model/timezone_model.dart';
import 'package:world_clock_case/service/timezone_service/timezone_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxBool isCountryLoading = false.obs;
  var timezones = <String>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    getCountryList();
    super.onInit();
  }

  void getCountryList() async {
    try {
      isCountryLoading(true);
      var result = await TimezoneService().getTimezones();
      if (result != null) {
        timezones.assignAll(temperaturesFromJson(result.body));
      }
    } finally {
      isCountryLoading(false);
    }
  }
}
