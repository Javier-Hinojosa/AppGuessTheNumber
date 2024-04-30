import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:guess_the_number/core/common/extensors.dart';
import 'package:guess_the_number/core/values/globals.dart';
import 'dart:math';

import 'package:guess_the_number/models/level.model.dart';

class HomeController extends GetxController {
  final textEditingController = TextEditingController(text: "").obs;
  final Rx<String> errorText="".obs;
  final RxInt attempts = 0.obs;
  final smallerThan = <int>[].obs;
  final higherThan = <int>[].obs;
  final RxList<MapEntry<int, bool>> history = <MapEntry<int, bool>>[].obs;
  final RxInt answer = 0.obs;
  final levelId = 0.obs;

  static final levelDifficulty = Globals.levels;

  @override
  void onInit() {
    super.onInit();

    attempts(currentLevel.attempts);
    answer(_generateNumber());
  }

  LevelModel get currentLevel => levelDifficulty.firstWhere((element) => element.id == levelId());

  _generateNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(currentLevel.maxNumber) + 1;
    return randomNumber;
  }

  onDifficultyChange(double id) {
    higherThan().clear();
    smallerThan().clear();
    levelId(id.toInt());
    attempts(currentLevel.attempts);
  }

  onCompleteTextEditing() {
    errorText("");
    var response = textEditingController().text;
    if (response.isInt()) {
      attempts(attempts()-1);
      var responseValue = int.parse(response);
      var attemptsValue= attempts();

     var isFinish = _validateAnswer(responseValue);

      if (attemptsValue==0 && !isFinish) {
        _finishGame(responseValue,false);
      }

    } else {
      errorText("Campo Invalido");
    }

    textEditingController().text = "";
  }

  bool _validateAnswer(int responseValue) {
    var answerValue = answer();
    if (responseValue == answerValue) {
      _finishGame(responseValue, true);
      return true;
    } else if (responseValue > answerValue) {
      higherThan.add(responseValue);
      return false;
    } else if (responseValue < answerValue) {
      smallerThan.add(responseValue);
      return false;
    }
    return false;
  }

  _finishGame(int response, bool value){
    higherThan.clear();
    smallerThan.clear();
    history.addValue(response,value);
    answer(_generateNumber());
    attempts(currentLevel.attempts);
  }

  exitApp() {
      exit(0);
  }

}
