//deepred vs brown (PROTAN)
import 'dart:math';
import 'dart:ui';

import 'package:observationStudyScaffold/models/colour_name.dart';

class TutorialTempColourModel {
  final List<Color> deepred = const [
    Color(0xff950000),
    Color(0xff950009),
    Color(0xff900e08),
    Color(0xff950013),
    Color(0xff8f0f12),
    Color(0xff94001c),
    Color(0xff8f0f1b),
    Color(0xff930023),
    Color(0xff8e1023),
    Color(0xff810000),
    Color(0xff7b0900),
    Color(0xff800006),
  ];

  final List<Color> brown = const [
    Color(0xff774800),
    Color(0xff76480d),
    Color(0xff754819),
    Color(0xff744822),
    Color(0xff6e4b22),
    Color(0xff73482b),
    Color(0xff6d4c2b),
    Color(0xff683c00),
    Color(0xff624000),
    Color(0xff683d0d),
    Color(0xff62400c),
    Color(0xff673d17),
  ];

  //darkgreen vs darkbrown (deutan)
  final List<Color> darkgreen = const [
    Color(0xff193711),
    Color(0xff0b3911),
    Color(0xff003a11),
    Color(0xff163719),
    Color(0xff043919),
    Color(0xff003a19),
    //Color(0xff003921),
    Color(0xff132c00),
    Color(0xff062d00),
    Color(0xff002e00),
    Color(0xff0f2c03),
    Color(0xff012d03),
  ];

  final List<Color> darkbrown = const [
    Color(0xff3e2d1b),
    Color(0xff432b22),
    Color(0xff3c2d22),
    Color(0xff3a2006),
    Color(0xff342205),
    //Color(0xff2e2505),
    Color(0xff382010),
    Color(0xff332310),
    Color(0xff372018),
    Color(0xff312318),
    Color(0xff35201f),
    Color(0xff2f1500),
  ];

  //teal vs grey (protan)
  final List<Color> grey = const [
    Color(0xffafaba2),
    Color(0xffa6aea2),
    Color(0xffababab),
    Color(0xffa29d95),
    Color(0xff98a095),
    Color(0xff9e9e9e),
    Color(0xff949088),
    Color(0xff8b9388),
    Color(0xff919191),
    Color(0xff879390),
    Color(0xff87837b),
    Color(0xff7e867b),
  ];

  final List<Color> teal = const [
    Color(0xff489f90),
    Color(0xff32a190),
    Color(0xff04a38f),
    Color(0xff00a58f),
    Color(0xff3d9f98),
    Color(0xff1fa198),
    Color(0xff00a398),
    Color(0xff399283),
    Color(0xff1f9383),
    Color(0xff009583),
    Color(0xff2c928b),
    Color(0xff00948b),
  ];

  //pink vs grey (deutan)
  final List<Color> darkPink = const [
    Color(0xffcc4769),
    Color(0xffc64e68),
    Color(0xffbf5468),
    Color(0xffb95968),
    Color(0xffd14071),
    Color(0xffca4871),
    Color(0xffc44e70),
    Color(0xffbd5470),
    Color(0xffc94879),
    Color(0xffc24f79),
    Color(0xffbb5579),
    Color(0xffc3305d),
  ];

  //neongreen vs yellow (protan)
  final List<Color> neongreen = const [
    Color(0xff79ff0b),
    Color(0xff51ff05),
    Color(0xff31ff02),
    Color(0xff63ff2b),
    Color(0xff4cff2a),
    Color(0xff28ff29),
    Color(0xff5fff3e),
    Color(0xff46ff3d),
    Color(0xff19ff3d),
    Color(0xff68f100),
    Color(0xff55f300),
  ];

  final List<Color> yellow = const [
    Color(0xfffff500),
    Color(0xfffff500),
    Color(0xfffff500),
    Color(0xfffff500),
    Color(0xfffff500),
    Color(0xfffff500),
    Color(0xfffff500),
    Color(0xfffff500),
    Color(0xfffff500),
    // Color(0xfffbf800),
    // Color(0xfff2fb00),
    // Color(0xffe9fd00),
    // Color(0xfffff51e),
    // Color(0xfffaf81c),
    // Color(0xfff1fb1a),
    // Color(0xfffff337),
    // Color(0xfffff536),
    // Color(0xfff9f835),
    // Color(0xfff0fb34),
    // Color(0xfffff347),
  ];

  //red vs darkorange deutan
  final List<Color> red = const [
    Color(0xffff150f),
    Color(0xffff151d),
    Color(0xffff1628),
    Color(0xfff40000),
    Color(0xfff30010),
    Color(0xffee0d0e),
    Color(0xfff3001d),
    Color(0xffed0e1c),
    Color(0xffed0f26),
    Color(0xffdd0000),
    Color(0xffd70400),
    Color(0xffdc000f),
  ];

  final List<Color> darkorange = const [
    Color(0xffcd6800),
    Color(0xffd04b02),
    Color(0xffca5100),
    Color(0xffc35700),
    Color(0xffbd5c00),
    Color(0xffb76000),
    Color(0xffcf4b15),
    Color(0xffc95114),
    Color(0xffc35712),
    Color(0xffbd5c11),
    Color(0xffc25720),
    Color(0xffbc5c1f),
  ];

  // distractor colours

  final List<Color> blue = const [
    Color(0xff0059ff),
    Color(0xff005dc1),
    Color(0xff1357ca),
    Color(0xff005aca),
    Color(0xff0056db),
    Color(0xff004df6),
    Color(0xff0045ff),
    Color(0xff004aff),
    Color(0xff0041ff),
    Color(0xff0049c5),
    Color(0xff0046cd),
    Color(0xff0043d6),
  ];

  final List<Color> royalBlue = const [
    Color(0xff001793),
    Color(0xff002393),
    Color(0xff00199b),
    Color(0xff00209b),
    Color(0xff002090),
    Color(0xff00209a),
    Color(0xff0014a3),
    Color(0xff0000ac),
    Color(0xff000dac),
    Color(0xff0000b4),
    Color(0xff0002b4),
  ];

  final List<Color> purple = const [
    Color(0xff5d1a79),
    Color(0xff5b0065),
    Color(0xff540765),
    Color(0xff4d1364),
    Color(0xff57006c),
    Color(0xff500a6c),
    Color(0xff520074),
    Color(0xff4a0d74),
    Color(0xff53007c),
    Color(0xff4c017c),
    Color(0xff49004a),
    Color(0xff4c0051),
  ];

  final List<Color> white = const [
    Color(0xfff7ffe2),
    Color(0xfffffeec),
    Color(0xfffdffeb),
    Color(0xfff3ffeb),
    Color(0xfffffff5),
    Color(0xfff9fff5),
    Color(0xffeefff5),
    Color(0xfffffcff),
    Color(0xffffffff),
    Color(0xfff4ffff),
    Color(0xfffffcff),
    Color(0xfffaffff),
  ];

  final List<Color> seaGreen = const [
    Color(0xff55ff9c),
    Color(0xff77fca7),
    Color(0xff63fea6),
    Color(0xff4affa6),
    Color(0xff1dffa6),
    Color(0xff6ffcb0),
    Color(0xff3bffb0),
    Color(0xff00ffb0),
    Color(0xff52ef99),
    Color(0xff34f199),
    Color(0xff00f399),
    Color(0xff47f0a3),
  ];

  final List<Color> burgundy = const [
    Color(0xff731727),
    Color(0xff6d1f27),
    Color(0xff72182e),
    Color(0xff6c202e),
    Color(0xff711835),
    Color(0xff660616),
    Color(0xff6a001d),
    Color(0xff65061d),
    Color(0xff690024),
    Color(0xff640724),
    Color(0xff5f1223),
    Color(0xff68002b),
  ];

  final List<Color> babyBlue = const [
    Color(0xffd0f7ff),
    Color(0xffc2e9f5),
    Color(0xffc8e6ff),
    Color(0xffbce9fe),
    Color(0xffcde4ff),
    Color(0xffc1e7ff),
    Color(0xffb5eaff),
    Color(0xffbad8f0),
    Color(0xffaedbf0),
    Color(0xffb3d9fa),
    Color(0xffa7dcf9),
    Color(0xffb9d6ff),
  ];

  final List<Color> darkBlue = const [
    Color(0xff08315c),
    Color(0xff0c2549),
    Color(0xff002849),
    Color(0xff0e2450),
    Color(0xff002650),
    Color(0xff0f2158),
    Color(0xff002458),
    Color(0xff0f1f5f),
    Color(0xff00225f),
    Color(0xff002067),
    Color(0xff001c45),
    Color(0xff00184c),
  ];

  final List<Color> green = const [
    Color(0xff31b52f),
    Color(0xff02b72e),
    Color(0xff21a708),
    Color(0xff00a906),
    Color(0xff36a620),
    Color(0xff19a71f),
    Color(0xff00a91f),
    Color(0xff31a62e),
    Color(0xff0ca82e),
    Color(0xff00a92e),
    Color(0xff2aa63a),
    Color(0xff00a83a),
  ];

  final List<Color> darkYellow = const [
    Color(0xffdcb500),
    Color(0xffd4b800),
    Color(0xffccbb00),
    Color(0xffd3b810),
    Color(0xffcbbb0d),
    Color(0xffd2b827),
    Color(0xffcabb26),
    Color(0xffcca800),
    Color(0xffc4ab00),
    Color(0xffbcae00),
    Color(0xffcba815),
    Color(0xffc3ab13),
  ];

  // final List<List<Color>> possibleDistractionSet = const [
  //   darkYellow,

  // ];

  Set<List<Map<String, Object>>> confusionSet;

  List<Color> colourSet = [];

  List<Color> get generatedColours {
    return colourSet;
  }

  int _currentRound = 0;
  final _totalRounds = 3;

  List<int> targetColoursList = [];
  Color targetColour;
  List<int> indexesOfTarget = [];

  // final int maxTargetColours = 3;
  // final int maxConfusionColours = 10;
  // final int maxDistractorColours = 10;

  final int maxTargetColours;
  final int maxConfusionColours;
  final int maxDistractorColours;
  int numTargetColours = 0;

  ColourName colourname;

  String targetColourName;

  bool isProtan = false;

  TutorialTempColourModel.protan(
      {this.maxTargetColours,
      this.maxConfusionColours,
      this.maxDistractorColours,
      this.colourname}) {
    isProtan = true;
    _currentRound = 0;
    confusionSet = {
      [
        {
          'name': 'red',
          'list': deepred,
        },
        {
          'name': "brown",
          'list': brown,
        },
      ],
      [
        {
          'name': 'teal',
          'list': teal,
        },
        {
          'name': 'grey',
          'list': grey,
        },
      ],
      [
        {
          'name': 'green',
          'list': neongreen,
        },
        {
          'name': 'yellow',
          'list': yellow,
        },
      ],
      [
        {
          'name': 'blue',
          'list': royalBlue,
        },
        {
          'name': 'purple',
          'list': purple,
        },
      ],
      [
        {
          'name': 'pink',
          'list': darkPink,
        },
        {
          'name': 'grey2',
          'list': grey,
        },
      ],
      [
        {
          'name': 'orange',
          'list': darkorange,
        },
        {
          'name': 'red2',
          'list': red,
        },
      ],
    };

    _playGame();
  }

  TutorialTempColourModel.deutan(
      {this.maxTargetColours = 1,
      this.maxConfusionColours = 1,
      this.maxDistractorColours = 2,
      this.colourname}) {
    isProtan = false;
    _currentRound = 0;
    confusionSet = {
      [
        {
          'name': 'darkgreen',
          'list': darkgreen,
        },
        {
          'name': 'darkbrown',
          'list': darkbrown,
        },
      ],
      [
        {
          'name': 'darkblue',
          'list': darkBlue,
        },
        {
          'name': 'purple',
          'list': purple,
        },
      ],
      [
        {
          'name': ' red ',
          'list': red,
        },
        {
          'name': 'darkorange',
          'list': darkorange,
        }
      ],
    };
    _playGame();
  }

  _playGame() {
    if (_currentRound >= _totalRounds) return;
    colourSet = [];
    Random random = Random();
    // int colVal = random.nextInt(confusionSet.length);
    // var temp = confusionSet.elementAt(colVal);
    // confusionSet.remove(temp);

    //int nameVal;//= random.nextInt(temp.length);
    if (colourname == ColourName.red) {
      targetColourName = "red";
    } else if (colourname == ColourName.orange) {
      targetColourName = "orange";
    } else if (colourname == ColourName.yellow) {
      targetColourName = "yellow";
    } else if (colourname == ColourName.green) {
      targetColourName = "green";
    } else if (colourname == ColourName.teal) {
      targetColourName = "teal";
    } else if (colourname == ColourName.blue) {
      targetColourName = "blue";
    } else if (colourname == ColourName.purple) {
      targetColourName = "purple";
    } else if (colourname == ColourName.pink) {
      targetColourName = "pink";
    } else {
      targetColourName = "grey";
    }
    int index = 0;
    int index2 = 0;
    // for(int j = 0; j < confusionSet.length; j++) {}
    bool found = false;
    confusionSet.forEach((element) {
      for(int i = 0; i < element.length; i++) {
        if(element[i]['name'] == targetColourName) {
          index2 = i;
          found = true;
          //element.removeAt(i);
          break;
        }
      }
      if(!found)
        index++;
      // element.removeWhere((element) {
      //   element.
      //   //element['name'] == targetColourName;
      // });
    });
    
    
    var temp = confusionSet.elementAt(index);
    // targetColourName = temp[(nameVal)]['name'];
    // int tempTar = random.nextInt(100 * (maxTargetColours + 1));
    // numTargetColours = (tempTar / 100).ceil() - 1;
    // if(numTargetColours == -1) numTargetColours = 0;
    // if (numTargetColours == 0) {
    //   numTargetColours = 1;
    // }
    // int numTargetColours = random.nextInt(maxTargetColours + 1);
    int numTargetColours = 1;

    targetColoursList.add(numTargetColours);
    //int numTargetColours = random.nextInt(maxTargetColours + 1);

    for (int i = 0; i < numTargetColours; i++) {
      var tempList = (temp[index2]['list'] as List<Color>);
      int valToadd = random.nextInt(tempList.length);
      colourSet.add(tempList[valToadd]);
      //tempList.removeWhere((element) => element == tempList[valToadd]);
      //tempList.removeAt(valToadd);
    }
    targetColour = colourSet[0];


    temp.remove(temp[index2]);

    int numConfusionColours =
        maxConfusionColours + (maxTargetColours - numTargetColours);
    for (int i = 0; i < numConfusionColours; i++) {
      var tempList = (temp[0]['list'] as List<Color>);
      int valToadd = random.nextInt(tempList.length);
      colourSet.add(tempList[valToadd]);

      //tempList.removeWhere((element) => element == tempList[valToadd]);
    }
    List<Color> distractList = [];
    if (targetColourName == 'red' ||
        targetColourName == 'brown' ||
        targetColourName == 'orange' ||
        targetColourName == 'darkbrown' ||
        targetColourName == 'darkorange' ||
        targetColourName == ' red ') {
      distractList = [
        ...darkBlue,
        ...babyBlue,
        ...seaGreen,
        ...purple,
        ...blue,
        ...royalBlue,
        ...teal,
        //...yellow,
        ...neongreen,
      ];
    } else if (targetColourName == 'green' ||
        targetColourName == 'yellow' ||
        targetColourName == 'darkgreen') {
      distractList = [
        ...darkBlue,
        ...babyBlue,
        ...purple,
        ...blue,
        ...royalBlue,
        ...teal,
        ...grey,
        ...darkPink
      ];
    } else if (targetColourName == 'teal' ||
        targetColourName == 'grey' ||
        targetColourName == 'pink') {
      distractList = [
        ...darkBlue,
        ...purple,
        ...blue,
        ...royalBlue,
        ...red,
        ...green,
        //...yellow,
        ...neongreen,
        ...darkorange,
        ...darkgreen,
        ...darkbrown,
        ...darkYellow,
        ...burgundy,
        ...darkorange,
        ...brown,
        ...deepred,
      ];
    } else {
      distractList = [
        ...seaGreen,
        ...green,
        ...yellow,
        ...neongreen,
        ...darkYellow,
        ...burgundy,
        ...deepred,
        ...teal,
        ...darkPink,
        ...grey
      ];
      //...darkorange, ...darkgreen, ...darkbrown,
    }
    for (var i = 0; i < maxDistractorColours; i++) {
      var index = random.nextInt(distractList.length);
      colourSet.add(distractList[index]);
    }

    colourSet.shuffle();
    for (var i = 0; i < colourSet.length; i++) {
      if (targetColourName == 'red') {
        if (deepred.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'brown') {
        if (brown.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'teal') {
        if (teal.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'grey') {
        if (grey.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'green') {
        if (neongreen.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'yellow') {
        if (yellow.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'blue') {
        if (royalBlue.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'purple') {
        if (purple.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'pink') {
        if (darkPink.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'orange') {
        if (darkorange.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'darkgreen') {
        if (darkgreen.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'darkbrown') {
        if (darkbrown.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'darkblue') {
        if (darkBlue.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == 'darkorange') {
        if (darkorange.contains(colourSet[i])) indexesOfTarget.add(i);
      } else if (targetColourName == ' red ') {
        if (red.contains(colourSet[i])) indexesOfTarget.add(i);
      }
    }
  }
}
