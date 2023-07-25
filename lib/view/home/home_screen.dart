import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_clock_case/controller/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Obx(() {
            if (homeController.isCountryLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
