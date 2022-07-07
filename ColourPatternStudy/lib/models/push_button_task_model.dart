import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PushButtonTaskModel {
  //List<String> textOnButtons;
  List<Widget> widgets;

  PushButtonTaskModel({
    
    
    //@required this.textOnButtons,
    @required this.widgets,
  });

  int count() {
    return widgets.length;
  }


  Widget onNext() {
    if(widgets.length > 0) {
      return widgets.removeAt(0);
    } else {
      return Container();
    }
  }

}
