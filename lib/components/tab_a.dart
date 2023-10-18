import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_task/function/capitalize_first_letter_function.dart';
import 'package:internship_task/function/get_color_function.dart';

import '../controllers/color_controller.dart';

class TabA extends StatelessWidget {
  TabA({super.key});

  final TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorController = Get.find<ColorController>();

    String initialText = colorController.selectedColor.value.isNotEmpty
        ? colorController.selectedColor.value
        : '';

    colorController.textEditingController.text = initialText;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                String selectedColor = colorController.selectedColor.value;
                String displayText = selectedColor.isNotEmpty
                    ? 'Selected Color: ${capitalizeFirstLetter(selectedColor)}'
                    : 'Selected Color: None';
                return Text(
                  displayText,
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Widget 2',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Obx(
              () => Container(
                width: 500,
                height: 500,
                color: getColor(colorController.selectedColor.value),
                child: Center(
                  child: Container(
                    height: 80.0,
                    width: 300.0,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black45,
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: colorController.textEditingController,
                      onChanged: (color) {
                        colorController.updateColor(color);
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Enter color',
                        hintStyle: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 0.8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
