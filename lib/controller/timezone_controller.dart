import 'package:get/get.dart';
import 'package:world_clock_case/model/timeData_model.dart';
import 'package:world_clock_case/service/timezone_service/timezone_service.dart';

class TimezoneController extends GetxController {
  final String url;
  final TimezoneService _timeService = TimezoneService();

  var isLoading = true.obs;
  var timeData = TimeData(
    abbreviation: '',
    clientIp: '',
    datetime: DateTime.now(),
    dayOfWeek: 0,
    dayOfYear: 0,
    dst: false,
    dstFrom: null,
    dstOffset: 0,
    dstUntil: null,
    rawOffset: 0,
    timezone: '',
    unixtime: 0,
    utcDatetime: DateTime.now(),
    utcOffset: '',
    weekNumber: 0,
  ).obs;

  @override
  void onInit() {
    fetchTimeData(url);
    super.onInit();
  }

  TimezoneController(this.url);

  void fetchTimeData(String url) async {
    try {
      isLoading(true);
      var data = await _timeService.getTimeData(url);
      timeData.value = data;
    } catch (e) {
      print('Hata oluştu: $e');
    } finally {
      isLoading(false);
    }
  }
}
