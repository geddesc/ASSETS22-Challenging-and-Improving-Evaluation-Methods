import 'package:flutter/material.dart';

class AnimateText extends StatefulWidget {
  final String text;
  final List<String> keywords;
  final bool isFadeIn;

  AnimateText(
      {@required this.text, @required this.keywords, @required this.isFadeIn});

  @override
  _AnimateTextState createState() => _AnimateTextState();
}

class _AnimateTextState extends State<AnimateText> {
  final List<AnimationController> _animationControls = [];
  final int _animationDelay = 1000;

  @override
  Widget build(BuildContext context) {
    List<String> textList = widget.text.split(" ");
    int textListLen = textList.length;
    return Container(
      height: 500,

      // child: Text.rich(
      //   TextSpan(children: <InlineSpan>[
      //     for (int i = 0; i < textListLen; i++)
      //       widget.isFadeIn
      //           ? widget.keywords.isEmpty
      //               ? _buildTextFadeIn(textList[i], i, false)
      //               : widget.keywords.contains(textList[i])
      //                   ? _buildTextFadeIn(textList[i], i, true)
      //                   : WidgetSpan(child: Text('${textList[i]}'))
      //           : widget.keywords.isEmpty
      //               ? _buildTextLinear(textList[i], i, false)
      //               : widget.keywords.contains(textList[i])
      //                   ? _buildTextLinear(textList[i], i, true)
      //                   : WidgetSpan(child: Text('${textList[i]}')),
      //   ]),
    // ),
    //   ),
    );
  }

//   WidgetSpan _buildTextLinear(String word, int index, bool isKeyword) {
//     int startAnimationVal = 500 * (index + 1);
//     return WidgetSpan(
//       child: Animate.withChild(
//         begin: MediaQuery.of(context).size.width,
//         end: 0,
//         curve: Curves.linear,
//         control: (context) {
//           Future.delayed(
//               Duration(milliseconds: startAnimationVal + _animationDelay), () {
//             _animationControls.add(context.controller);
//             context.controller?.forward();
//           });
//         },
//         duration: Duration(milliseconds: startAnimationVal),
//         child: Text(
//           "$word ",
//         ),
//         render: (state, child) => Transform.translate(
//           offset: Offset(state.animation.value, 0),
//           child: child,
//         ),
//       ),
//     );
//   }

//   WidgetSpan _buildTextFadeIn(String word, int index, bool isKeyword) {
//     int startAnimationVal = 500 * (index + 1);
//     return WidgetSpan(
//       child: Animate.withChild(
//         begin: 0, //MediaQuery.of(context).size.width,
//         end: 1,
//         curve: Curves.linear,
//         control: (context) {
//           Future.delayed(
//               Duration(milliseconds: startAnimationVal + _animationDelay), () {
//             _animationControls.add(context.controller);
//             context.controller?.forward();
//           });
//         },
//         duration: Duration(milliseconds: startAnimationVal),
//         child: Text(
//           "$word ",
//         ),
//         render: (state, child) => Opacity(
//           opacity: state.animation.value,
//           child: child,
//         ),
//         // render: (state, child) => Transform.translate(
//         //   offset: Offset(state.animation.value, 0),
//         //   child: child,
//         // ),
//       ),
//     );
//   }
}
