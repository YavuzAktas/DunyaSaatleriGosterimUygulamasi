import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_case/component/main_header.dart';
import 'package:world_clock_case/const/const.dart';
import 'package:world_clock_case/controller/controller.dart';
import 'package:world_clock_case/controller/home_controller.dart';
import 'package:world_clock_case/theme/app_theme.dart';
import 'package:world_clock_case/view/localTime/localTime_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String hourFormatted = DateFormat('HH:mm').format(now);
    String dateFormatted = DateFormat('d MMMM, EEEE', 'tr_TR').format(now);

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.24 - 27,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(IconConstants.header.toPng),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 33, right: 33),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Günaydın, Özgür!',
                              style: TextStyle(
                                  color: AppTheme.lightTextColor, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              hourFormatted,
                              style: TextStyle(
                                  color: AppTheme.lightTextColor, fontSize: 32),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              dateFormatted,
                              style: TextStyle(
                                  color: AppTheme.lightTextColor, fontSize: 15),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 45),
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(IconConstants.night.toPng)),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      height: 54,
                      child: const MainHeader(),
                    )),
              ],
            ),
          ),
          Obx(() {
            if (homeController.isCountryLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: homeController.timezones.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => LocalTimeScreen(
                            url: "/${homeController.timezones[index]}"));
                      },
                      child: ListTile(
                        title: Text(homeController.timezones[index]),
                        trailing: Icon(
                          Icons.arrow_circle_right_outlined,
                          color: AppTheme.lightTextColor,
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
