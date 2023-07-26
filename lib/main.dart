import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:world_clock_case/route/app_page.dart';
import 'package:world_clock_case/route/app_route.dart';
import 'package:world_clock_case/theme/app_theme.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('tr_TR').then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
