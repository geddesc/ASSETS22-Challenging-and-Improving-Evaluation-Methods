import 'package:flutter/material.dart';

class DropdownBox extends StatefulWidget {
  final String question;
  final List<String> options;

  DropdownBox({
    @required this.question,
    @required this.options,
  });

  @override
  _DropdownBoxState createState() => _DropdownBoxState();
}

class _DropdownBoxState extends State<DropdownBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
