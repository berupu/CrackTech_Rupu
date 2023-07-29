import 'package:cracktech/states/bindings/InitialBinding.dart';
import 'package:cracktech/view/Movies/HomeScreen/movieHome.dart';
import 'package:cracktech/view/Movies/splashScreen/spash.dart';
import 'package:get/route_manager.dart';

class AllRoutes {
  static List<GetPage> allRoutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: MovieHome.routeName,
      page: () => const MovieHome(),
      binding: HomeBinding(),
    ),
  ];
}
