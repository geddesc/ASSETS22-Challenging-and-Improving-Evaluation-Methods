import 'package:flutter/material.dart';

class ColourMixTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Colour Mix Test Screen'
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            width: 50,
            color: Colors.red,
            child: Image.asset("/images/tree.png"),
            
          ),
        ],
      ),
    );
  }
}
