import 'package:flutter/material.dart';

class PushButtonTask extends StatelessWidget {
  final Function onPressed;
  final Color color;

  PushButtonTask({
    @required this.onPressed,
    this.color,
  });

  // final PushButtonTaskModel model;
  // PushButtonTask({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: onPressed,
            child: Text('Push Me'),
            color: color,
          ),
        ],
      ),
    );
  }
}
