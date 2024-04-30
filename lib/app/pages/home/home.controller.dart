import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:guess_the_number/core/values/globals.dart';
import 'dart:math';

class HomeController extends GetxController{
  final textEditingController = TextEditingController();
  final RxInt attempts= 0.obs;
  final smallerThan = <int>[].obs;
  final higherThan = <int>[].obs;
  final history = <int,bool>{}.obs;
  final RxInt answer = 0.obs;
  final levelId = 0.obs;
  static final levelDifficulty = Globals.levels;

  @override
  void onInit() {
    super.onInit();

   answer(_generateNumber());
  }

   get  currentLevel => levelDifficulty.firstWhere((element) =>element.id==levelId());


  _generateNumber(){
    Random random = Random();
    int randomNumber = random.nextInt(currentLevel.maxAttemps) + 1;
    return randomNumber;
  }

}