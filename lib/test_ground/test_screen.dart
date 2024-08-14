import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("TEST SCREEN"),
      ),
      body: GetBuilder<CounterController>(
        init: CounterController(),
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                Text(
                  'count : ${controller.count}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.increment();
                      },
                      child: const Text('증가'),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.decrement();
                      },
                      child: const Text('감소'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CounterController extends GetxController {
  int count = 0;

  void increment() {
    count++;
    print("count : $count");
    update();
  }

  void decrement() {
    count--;
    print("count : $count");
    update();
  }
}
