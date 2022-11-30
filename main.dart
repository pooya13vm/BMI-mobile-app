import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const myApp());

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const _HomePageState({Key? key}) : super(key:key);

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.yellowAccent, fontSize: 15),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(221, 0, 0, 0),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black,
                    width: 100,
                    height: 65,
                    child: TextField(
                      controller: _heightController,
                      style: const TextStyle(color: Colors.amber, fontSize: 32),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: 100,
                    height: 65,
                    child: TextField(
                      controller: _weightController,
                      style: const TextStyle(color: Colors.amber, fontSize: 32),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  double height = double.parse(_heightController.text);
                  double weight = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = weight / (height * height);
                    if (_bmiResult > 25) {
                      _textResult = "Over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "Normal weight";
                    } else {
                      _textResult = "Under weight";
                    }
                  });
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: Colors.amberAccent, fontSize: 28),
                )),
            const SizedBox(
              height: 50,
            ),
            Text(
              _bmiResult.toString(),
              style: const TextStyle(color: Colors.amberAccent, fontSize: 35),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: const TextStyle(color: Colors.amberAccent, fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const RightBar(barWidth: 25),
            const RightBar(barWidth: 50),
            const RightBar(barWidth: 25),
            const LeftBar(barWidth: 25),
            const LeftBar(barWidth: 25)
          ],
        ));
  }
}

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 26,
            width: barWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.amber),
          )
        ],
      ),
    );
  }
}

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 26,
            width: barWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.amber),
          )
        ],
      ),
    );
  }
}
