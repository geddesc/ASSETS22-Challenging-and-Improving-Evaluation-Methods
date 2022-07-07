import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  // List<Widget Function(Function() onNext)> list
  List<Widget Function(Function() onNext)> list;
  Widget completionWidget;
  double height;
  double width;
  Task({
    this.list,
    this.completionWidget,
    this.height,
    this.width,
  });

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int _show = 0;

  @override
  Widget build(BuildContext context) {
    if (_show == widget.list.length) {
      return widget.completionWidget ?? Container();
    }
    return widget.list[_show](() {
      setState(() {
        _show++;
      });
    });
  }
}
