import 'package:get/route_manager.dart';
import 'package:world_clock_case/route/app_route.dart';
import 'package:world_clock_case/view/dashboard/dashboard_binding.dart';
import 'package:world_clock_case/view/dashboard/dashboard_screen.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashBoardBinding())
  ];
}
