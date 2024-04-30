import 'package:get/get.dart';
import 'package:guess_the_number/app/pages/home/home.binding.dart';
import 'package:guess_the_number/app/pages/home/home.page.dart';
import 'package:guess_the_number/core/routes/routes.dart';

abstract class Pages {

  static final pages = [
  GetPage(
  name: Routes.home,
  page: () => const HomePage(),
  binding: HomeBinding())
  ];

}