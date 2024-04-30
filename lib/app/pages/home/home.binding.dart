import 'package:get/get.dart';
import 'package:guess_the_number/app/pages/home/home.controller.dart';

class HomeBinding implements Bindings {


  HomeBinding();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}