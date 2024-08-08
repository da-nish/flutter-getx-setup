import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/mixin_state.dart';
import 'package:sm_reit/app/modules/screen_e/controllers/ctrl.dart';

class StateWidget extends StatefulWidget {
  const StateWidget({super.key});

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  final ControllerD controllerD = Get.put(ControllerD());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: MixinBuilder<ControllerA>(
            init: ControllerA(),
            builder: (cc) {
              print("hash2: ${cc.hashCode}");
              return Center(
                child: TextButton(
                  onPressed: () {
                    cc.increment();
                  },
                  child: Text(
                    'MixinBuilder: ${cc.count}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: GetBuilder<ControllerB>(
            init: ControllerB(),
            builder: (cc) {
              print("hash2: ${cc.hashCode}");
              return Center(
                child: TextButton(
                  onPressed: () {
                    cc.increment();
                    cc.update();
                  },
                  child: Text(
                    'GetBuilder: ${cc.count}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: GetBuilder<ControllerC>(
            init: ControllerC(),
            builder: (cc) {
              print("hash2: ${cc.hashCode}");
              return Center(
                child: TextButton(
                  onPressed: () {
                    cc.increment();
                    cc.update();
                  },
                  child: Text(
                    'GetBuilder + worker: ${cc.count}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: Obx(
            () {
              print("hash2: ${controllerD.hashCode}");
              return Center(
                child: TextButton(
                  onPressed: () {
                    controllerD.increment();
                  },
                  child: Text(
                    'Obx: ${controllerD.count}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
