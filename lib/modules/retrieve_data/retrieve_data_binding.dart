import 'package:devcode_flutter_starter/modules/retrieve_data/retrieve_data_controller.dart';
import 'package:get/get.dart';

class RetrieveDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RetrieveDataController(), fenix: true);
  }

}