import 'package:flutter/material.dart';

import '../../theme/design_theme.dart';

class CvdSimulationInformation extends StatelessWidget {
  final Function onNext;

  var appBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: FittedBox(
      child: SelectableText(
        'Colour Blindness Simulation',
        showCursor: true,
        toolbarOptions: ToolbarOptions(
          copy: true,
          selectAll: true,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: DesignTheme.headerFontSize,
          color: Colors.black,
        ),
      ),
    ),
  );

  CvdSimulationInformation({
    @required this.onNext,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600,
            minWidth: 300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    "For this study, you will be shown colours through a red-green colour blind simulation at a given severity. As such, colours won't appear as they normally do, so many of the tasks (which are colour-related) will likely be challenging. Regardless, please try your best to complete each task. Here is some information to help you understand the common experiences of people with red-green colour blindness:",
                    showCursor: true,
                    toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  SelectableText(
                    "1. Purples lose their 'redness', so are often seen as shades of blue.",
                    showCursor: true,
                    toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,
                    ),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  SelectableText(
                    "2. Pinks lose their 'redness', so often appear to be grey.",
                    showCursor: true,
                    toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  SelectableText(
                    "3: Reds and greens are less vibrant, so are often seen as a shades of orange or brown, leading to confusion between reds, oranges, medium-dark greens, and browns.",
                    showCursor: true,
                    toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  SelectableText(
                    "4. Neon/lime greens are less vibrant but still just as bright, so are often confused with yellows.",
                    showCursor: true,
                    toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,
                    ),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                  ),

                  // SizedBox(height: 40),
                  // Text(
                  //   "This information is meant to help you with the tasks, so please try your best to complete each task. But understand that this will be hard as this is a way of viewing colours you're not used to.",
                  //   style: TextStyle(fontSize: 18),
                  // ),
                ],
              ),

              //SizedBox(height: 20),
              Center(
                child: RaisedButton(
                  onPressed: onNext,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(DesignTheme.defaultRadiusVal),
                  ),
                  color: DesignTheme.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(DesignTheme.mediumPadding),
                    child: FittedBox(
                      child: Text(
                        "Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: DesignTheme.titleFontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
