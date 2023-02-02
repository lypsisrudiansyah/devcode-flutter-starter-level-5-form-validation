import 'package:devcode_flutter_starter/modules/hello/hello_view.dart';
import 'package:devcode_flutter_starter/modules/home/home_view.dart';
import 'package:devcode_flutter_starter/modules/retrieve_data/retrieve_data_binding.dart';
import 'package:devcode_flutter_starter/modules/retrieve_data/retrieve_data_view.dart';
import 'package:devcode_flutter_starter/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.hello,
      page: () => const HelloView(),
    ),
    GetPage(
      name: Routes.retrieveData,
      page: () => const RetrieveDataView(),
      binding: RetrieveDataBinding()
    ),
  ];
}
