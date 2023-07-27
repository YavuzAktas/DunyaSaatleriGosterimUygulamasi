import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:world_clock_case/const/const.dart';
import 'package:world_clock_case/controller/home_controller.dart';
import 'package:world_clock_case/controller/timezone_controller.dart';
import 'package:world_clock_case/theme/app_theme.dart';

class LocalTimeScreen extends StatelessWidget {
  final String url;
  const LocalTimeScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TimezoneController(url));
    DateTime dateTime =
        DateTime.parse(controller.timeData.value.datetime.toString());

    // Format the date in "Çarşamba" format using the intl package
    String formattedDate = DateFormat('EEEE', 'tr_TR').format(dateTime);
    String formattedDate2 = DateFormat('MMMM d, y', 'tr_TR').format(dateTime);
    String hour = DateFormat('HH').format(dateTime);
    String minute = DateFormat('mm').format(dateTime);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: AppTheme.lightTextColor),
        title: Text(
          'WORLD TIME',
          style: TextStyle(color: AppTheme.lightTextColor),
        ),
        flexibleSpace: Container(
          height: MediaQuery.of(context).size.height * 0.14,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(IconConstants.header2.toPng),
                  fit: BoxFit.fill)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Obx(() => controller.isLoading.value
              ? Center(
                  child: const CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  20), // Yarıçapı genişlik/2 olarak ayarlanır
                              border: Border.all(
                                color: AppTheme.lightTextColor,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                hour,
                                style: TextStyle(
                                    fontSize: 79,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.lightTextColor),
                              ),
                            ),
                          ),
                          Text(
                            ':',
                            style: TextStyle(
                                fontSize: 100, color: AppTheme.lightTextColor),
                          ),
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  20), // Yarıçapı genişlik/2 olarak ayarlanır
                              border: Border.all(
                                color: AppTheme.lightTextColor,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(minute,
                                  style: TextStyle(
                                      fontSize: 79,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.lightTextColor)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        controller.timeData.value.timezone.split('/').first,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.lightTextColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        controller.timeData.value.timezone.split('/').last,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.lightTextColor),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        formattedDate +
                            ', GMT ' +
                            controller.timeData.value.utcOffset,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.lightTextColor,
                        ),
                      ),
                      Text(
                        formattedDate2,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.lightTextColor,
                        ),
                      ),
                    ],
                  ),
                )),
        ],
      ),
    );
  }
}
