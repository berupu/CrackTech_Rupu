import 'package:cracktech/constants/colors.dart';
import 'package:cracktech/states/bindings/InitialBinding.dart';
import 'package:cracktech/states/data/routes.dart';
import 'package:cracktech/view/movies/splashScreen/spash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: ConstantColors.lightGray,
            ),
          ),
          debugShowCheckedModeBanner: false,
          getPages: AllRoutes.allRoutes,
          initialRoute: SplashScreen.routeName,
          initialBinding: InitialBinding(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
