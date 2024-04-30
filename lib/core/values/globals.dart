import 'package:guess_the_number/models/level.model.dart';

abstract class Globals {
   static final List<LevelModel> levels = <LevelModel>[
     LevelModel(0,"Fácil",1,10,5),
     LevelModel(1,"Medio",1,20,8),
     LevelModel(2,"Avanzado",1,100,15),
     LevelModel(3,"Extremo",1,1000,25)
  ];

}