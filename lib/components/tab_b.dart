import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_task/function/get_color_function.dart';

import '../controllers/color_controller.dart';

class TabB extends StatelessWidget {
  const TabB({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () {
          final availableColors = Get.find<ColorController>().availableColors;

          if (availableColors.isEmpty) {
            return const Text(
              'No available colors',
              style: TextStyle(fontSize: 24),
            );
          }

          final random = Random();
          int index = random.nextInt(availableColors.length);
          Color randomColor = getColor(availableColors[index]);

          return Container(
            width: 200,
            height: 200,
            color: randomColor,
            child: const Center(
              child: Text(
                'Random Color',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
