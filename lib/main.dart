import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  String selectedColor = 'White';
  String typedColor = '';
  List<String> colors = ['White', 'Green', 'Red', 'Blue'];
  late Color randomColor;

  @override
  void initState() {
    super.initState();
    generateRandomColor();
  }

  void generateRandomColor() {
    List<String> availableColors = List.from(colors);
    availableColors.remove(typedColor);
    final random = Random();
    int index = random.nextInt(availableColors.length);
    randomColor = _getColor(availableColors[index]);
  }

  Color _getColor(String color) {
    switch (color) {
      case 'White':
        return Colors.white;
      case 'Green':
        return Colors.green;
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  void updateColor(String color) {
    setState(() {
      typedColor = color;
      selectedColor = typedColor;
      generateRandomColor();
    });
  }

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
          title: const Text('Color App'),
        ),
        body: TabBarView(
          children: [
            TabA(selectedColor: selectedColor, updateColor: updateColor),
            TabB(randomColor),
          ],
        ),
      ),
    );
  }
}

class TabA extends StatefulWidget {
  final String selectedColor;
  final Function(String) updateColor;

  const TabA({
    super.key,
    required this.selectedColor,
    required this.updateColor,
  });

  @override
  State<TabA> createState() => _TabAState();
}

class _TabAState extends State<TabA> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
        text: widget.selectedColor.toLowerCase() == 'white'
            ? ''
            : widget.selectedColor);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selected Color: ${_capitalizeFirstLetter(widget.selectedColor)}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            color: _getColor(_controller.text),
            child: Center(
              child: TextField(
                controller: _controller,
                onChanged: (color) {
                  widget.updateColor(color);
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter color',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(String color) {
    if (color.isEmpty) {
      return Colors.white; // Default color when the text field is empty
    }
    switch (color.toLowerCase()) {
      case 'white':
        return Colors.white;
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }

  String _capitalizeFirstLetter(String text) {
    return text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TabB extends StatelessWidget {
  final Color color;

  const TabB(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: color,
        child: const Center(
          child: Text(
            'Random Color',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
