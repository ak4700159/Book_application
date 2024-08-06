import 'package:flutter/material.dart';

// ------------  그리드뷰 ---------------
class MyGridView extends StatefulWidget {
  MyGridView(
      {super.key,
      required this.callback,
      required this.isSelectd,
      required this.selectedAll});
  List<bool> isSelectd;
  bool selectedAll;
  Function callback;

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  late List<bool> isSelectd;
  late bool selectedAll;
  late Function callback;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelectd = widget.isSelectd;
    selectedAll = widget.selectedAll;
    callback = widget.callback;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
