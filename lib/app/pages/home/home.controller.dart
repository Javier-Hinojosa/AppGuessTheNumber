import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:guess_the_number/core/values/globals.dart';
import 'dart:math';

import 'package:guess_the_number/models/level.model.dart';

class HomeController extends GetxController{
  final textEditingController = TextEditingController(text: "").obs;
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

  LevelModel get  currentLevel => levelDifficulty.firstWhere((element) =>element.id==levelId());


  _generateNumber(){
    Random random = Random();
    int randomNumber = random.nextInt(currentLevel.maxAttemps) + 1;
    return randomNumber;
  }

  onDifficultyChange(double id) {
    levelId(id.toInt());
  }

  OnCompleteTextEditing() {}

  onTrailing() {}

}