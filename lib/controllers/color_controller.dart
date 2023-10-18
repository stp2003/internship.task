import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  var selectedColor = 'White'.obs;
  var availableColors = ['White', 'Green', 'Red', 'Blue'].obs;
  late TextEditingController textEditingController;

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
  }

  void updateColor(String color) {
    if (color.isNotEmpty) {
      selectedColor.value = color;
    }
  }

  void removeSelectedColor() {
    availableColors.remove(selectedColor.value);
  }
}
