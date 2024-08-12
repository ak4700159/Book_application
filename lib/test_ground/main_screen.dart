import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEST SCREEN"),
      ),
      body: GetBuilder<CounterController>(
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                Text('${controller.count}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      key: UniqueKey(),
                      onPressed: () {
                        controller.increment();
                      },
                      child: const Text('증가'),
                    ),
                    FloatingActionButton(
                      key: UniqueKey(),
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
