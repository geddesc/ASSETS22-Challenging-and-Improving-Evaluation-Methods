import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';

class ApproveButton extends StatelessWidget {
  final String text;
  final Function onLongPress;
  final Function onPressed;

  ApproveButton({
    this.text = "Begin Study",
    this.onLongPress,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTheme.defaultRadiusVal),
      ),
      color: DesignTheme.primaryColor,
      onLongPress: onLongPress,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
