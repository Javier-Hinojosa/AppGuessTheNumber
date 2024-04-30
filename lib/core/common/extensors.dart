import 'package:get/get.dart';

extension MapExtension on RxList<MapEntry<int, bool>>{
  void addValue(int value1, bool value2){
    return add(MapEntry(value1, value2));
  }
}

extension ConfigureStrings on String {
  bool isInt() {
      var regExp = RegExp(r'^[0-9]+$');
    return regExp.hasMatch(this);
  }
}