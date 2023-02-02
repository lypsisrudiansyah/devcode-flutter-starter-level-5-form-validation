import 'package:devcode_flutter_starter/data/networking/base_service.dart';
import 'package:devcode_flutter_starter/routes/pages.dart';
import 'package:devcode_flutter_starter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_driver/driver_extension.dart';

void initFlutterDriver() async {
  enableFlutterDriverExtension();

  await FlutterDriver.connect();
}

void initCoreService() {
  Get.put(BaseService(), permanent: true);
}

void main() {
  initFlutterDriver();

  initCoreService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devcode Flutter Starter',
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
