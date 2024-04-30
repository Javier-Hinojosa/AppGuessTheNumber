
import 'package:flutter/material.dart';
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
        appBar: AppBar(title: const Text("Adinvina el Número"),
            elevation: 2,
        ),
        body: Obx(()=> ListBody(children: [
          _header(),
           _body(context),
          ]),
        ),

      ),
    );
  }

 Widget _header(){
    return Row(children: [
      CustomTextField("Numbers",controller.textEditingController),
      Column(children: [
        const CustomTitle(title: "Intentos"),
        CustomSubtitle(title: controller.attempts().toString())
      ])
    ]);
  }

Widget _body( BuildContext context) {
  return ListView(
    shrinkWrap: true,//take all space body,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CustomContainer(
          labelText: "Mayor que",
          child: ListView(shrinkWrap: true,physics: const BouncingScrollPhysics(),
            children: controller.higherThan.map((element) =>
                CustomTitle(title: element.toString())
            ).toList(),
          )),
        CustomContainer(
              labelText: "Menor que",
            child: ListView(shrinkWrap: true,physics: const BouncingScrollPhysics(),
              children: controller.higherThan.map((element) =>
                  CustomTitle(title: element.toString())
              ).toList(),
            )),
        CustomContainer(
            labelText: "Historial",
            child: ListView(shrinkWrap: true,physics: const BouncingScrollPhysics(),
              children: controller.history.entries.map((entry) =>
                 CustomTitle(
                  title: entry.key.toString(),
                  color: entry.value ? Colors.greenAccent : Colors.redAccent,
                )).toList(),
            ))

    ]
  );
}
}