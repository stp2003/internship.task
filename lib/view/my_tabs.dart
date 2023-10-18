import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_task/components/tab_a.dart';
import 'package:internship_task/components/tab_b.dart';

import '../controllers/color_controller.dart';

class MyTabs extends StatelessWidget {
  final ColorController colorController = Get.put(ColorController());

  MyTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'A'),
              Tab(text: 'B'),
            ],
          ),
          title: const Text('Color App  \n Widget 1'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            TabA(),
            const TabB(),
          ],
        ),
      ),
    );
  }
}
