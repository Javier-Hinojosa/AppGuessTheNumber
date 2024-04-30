
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guess_the_number/app/pages/home/home.controller.dart';
import 'package:guess_the_number/app/widgets/container/container.widget.dart';
import 'package:guess_the_number/app/widgets/text/subtitle.widget.dart';
import 'package:guess_the_number/app/widgets/text/title.widget.dart';
import 'package:guess_the_number/app/widgets/text_field/text_field.widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Adivina el Número"),
            elevation: 2,
          actions: [
            IconButton(onPressed: ()=>controller.onTrailing(), icon: const Icon(Icons.menu))
          ],
        ),
        body: Obx(()=> Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
          _header(),
           _body(context),
          ]),
        ),

      ),
    );
  }

 Widget _header(){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      SizedBox(
          width: Get.width*.5,
          height: Get.height*.1,
          child:
      CustomTextField("Numbers",controller.textEditingController(),
        maxCharts: 1000,
        maxLines: 1,
        onComplete:()=>controller.OnCompleteTextEditing(),
      textInputType: const TextInputType.numberWithOptions(decimal: false,signed: false),
      )),
      Flexible(
        child: Column(children: [
          const CustomTitle(title: "Intentos"),
          CustomSubtitle(title: controller.attempts().toString())
        ]),
      )
    ]).paddingOnly(top: 20);
  }

Widget _body( BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Expanded(
             child: CustomContainer(
                 labelText: "Mayor que",
                 child: ListView(shrinkWrap: true,physics: const BouncingScrollPhysics(),
                   children: controller.higherThan.map((element) =>
                       CustomTitle(title: element.toString())
                   ).toList(),
                 )).paddingAll(10)
           ),
           Expanded(
             child: CustomContainer(
                 labelText: "Menor que",
                 child: ListView(shrinkWrap: true,physics: const BouncingScrollPhysics(),
                   children: controller.higherThan.map((element) =>
                       CustomTitle(title: element.toString())
                   ).toList(),
                 )).paddingAll(10)
           ),
           Expanded(
             child: CustomContainer(
                 labelText: "Historial",
                 child: ListView(shrinkWrap: true,physics: const BouncingScrollPhysics(),
                   children: controller.history.entries.map((entry) =>
                       CustomTitle(
                         title: entry.key.toString(),
                         color: entry.value ? Colors.greenAccent : Colors.redAccent,
                       )).toList(),
                 )).paddingAll(10)
           )
         ],
        ),
        Divider(
          height: Get.height*.05,
          color: Colors.transparent,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSubtitle(title: controller.currentLevel.name),
            Slider(
              activeColor: Colors.blueAccent,
              value: controller.levelId.toDouble(),
              onChanged: (id)=> controller.onDifficultyChange(id),
              label: controller.currentLevel.name,
              divisions: HomeController.levelDifficulty.length-1,
              max: HomeController.levelDifficulty.length.toDouble()-1,
            ),
          ],
        ).paddingAll(16)
    ]
  );
}
}