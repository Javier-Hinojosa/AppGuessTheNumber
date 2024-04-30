import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_the_number/app/pages/home/home.controller.dart';
import 'package:guess_the_number/app/utils/msg.utils.dart';
import 'package:guess_the_number/app/widgets/container/container.widget.dart';
import 'package:guess_the_number/app/widgets/text/subtitle.widget.dart';
import 'package:guess_the_number/app/widgets/text/title.widget.dart';
import 'package:guess_the_number/app/widgets/text_field/text_field.widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adivina el Número"),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'option2',
                    onTap: () async => await onViewDifficulties(context),
                    child: const CustomSubtitle(title: 'Niveles'),
                  ),
                  PopupMenuItem(
                    value: 'option1',
                    onTap: () => controller.exitApp(),
                    child: const CustomSubtitle(title: 'Salir'),
                  )
                ];
              }
            )
          ]
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Obx(
            () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _header(),
                  _body(context),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: Get.width * .5,
              height: Get.height * .1,
              child: CustomTextField(
                "Numbers",
                controller.textEditingController(),
                hintText: "####",
                errorText: controller.errorText().isEmpty
                    ? null
                    : controller.errorText(),
                maxCharts: 4,
                maxLines: 1,
                onComplete: () => controller.onCompleteTextEditing(),
                textInputType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
              )),
          Flexible(
            child: Column(children: [
              const CustomTitle(title: "Intentos"),
              CustomSubtitle(title: controller.attempts().toString())
            ]),
          )
        ]).paddingOnly(top: 20);
  }

  Widget _body(BuildContext context) {
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
                      child: ListView(
                        shrinkWrap: true,
                        physics: const RangeMaintainingScrollPhysics(),
                        children: controller.smallerThan
                            .map((element) => CustomTitle(
                                title: element.toString(),
                                textAlign: TextAlign.center))
                            .toList(),
                      )).paddingAll(10)),
              Expanded(
                  child: CustomContainer(
                      labelText: "Menor que",
                      child: ListView(
                        shrinkWrap: true,
                        physics: const RangeMaintainingScrollPhysics(),
                        children: controller.higherThan
                            .map((element) => CustomTitle(
                                title: element.toString(),
                                textAlign: TextAlign.center))
                            .toList(),
                      )).paddingAll(10)),
              Expanded(
                  child: CustomContainer(
                      labelText: "Historial",
                      child: ListView(
                        shrinkWrap: true,
                        physics: const RangeMaintainingScrollPhysics(),
                        children: controller.history
                            .map((entry) => CustomTitle(
                                title: entry.key.toString(),
                                textAlign: TextAlign.center,
                                color: entry.value
                                    ? Colors.greenAccent
                                    : Colors.redAccent))
                            .toList(),
                      )).paddingAll(10))
            ],
          ),
          Divider(
            height: Get.height * .05,
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
                onChanged: (id) => controller.onDifficultyChange(id),
                label: controller.currentLevel.name,
                divisions: HomeController.levelDifficulty.length - 1,
                max: HomeController.levelDifficulty.length.toDouble() - 1,
              ),
            ],
          ).paddingAll(16)
        ]);
  }

  Future onViewDifficulties(BuildContext context) async {
    await MsgUtils.info(context,
        title: "Niveles",
        child: SizedBox(
          height: Get.height*.4,
          child: Column(
              children: ListTile.divideTiles(
                context: context,
                      tiles: HomeController.levelDifficulty.map((e) => ListTile(
                          title: CustomTitle(title: "${e.name}:"),
                          subtitle: CustomSubtitle(
                              title:
                                  "Encuentra el Número del ${e.minNumber} al ${e.maxNumber}, con ${e.attempts} intentos"))))
                  .toList()),
        ));
  }
}
