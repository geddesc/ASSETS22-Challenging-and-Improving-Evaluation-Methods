import 'dart:ui';
import 'dart:math';

import 'package:observationStudyScaffold/models/cvd_type.dart';

import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_tutorial_model.dart';

class ColourGameTutorial {
  int maxTargetColours;
  int maxConfusionColours;
  int maxDistractorColours;
  int numTargetColours;
  int colourPairChoiceNum;
  String targetColourName;
  int numberOfTargetColours;
  List<List<Map<String, Object>>> confusionSet;
  int maxColours;
  CvdType cvdType;
  Color targetColor;

  List<Color> colourSet = [];

  List<Color> get generatedColours {
    return colourSet;
  }

  //List<int> targetColoursList = [];
  List<int> indexesOfTarget = [];

  ColourGameTutorial.protan(this.maxTargetColours, this.maxConfusionColours,
      this.maxDistractorColours, this.colourPairChoiceNum, this.maxColours,
      [this.numTargetColours]) {
    confusionSet = [
      [
        {
          'name': 'grey',
          'list': ColourModelTutorial.pGrey,
        },
        {
          'name': "pink",
          'list': ColourModelTutorial.pPink,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pPinkGreyDisList,
        },
      ],
      [
        {
          'name': 'pink',
          'list': ColourModelTutorial.pPink,
        },
        {
          'name': "grey",
          'list': ColourModelTutorial.pGrey,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pPinkGreyDisList,
        },
      ],
      [
        {
          'name': 'green',
          'list': ColourModelTutorial.pGreen,
        },
        {
          'name': 'yellow',
          'list': ColourModelTutorial.pYellow,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pYellowGreenDisList,
        },
      ],
      [
        {
          'name': 'yellow',
          'list': ColourModelTutorial.pYellow,
        },
        {
          'name': 'green',
          'list': ColourModelTutorial.pGreen,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pYellowGreenDisList,
        },
      ],
      [
        {
          'name': 'purple',
          'list': ColourModelTutorial.pPurple,
        },
        {
          'name': 'blue',
          'list': ColourModelTutorial.pBlue,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pBluePurpleDisList,
        },
      ],
      [
        {
          'name': 'blue',
          'list': ColourModelTutorial.pBlue,
        },
        {
          'name': 'purple',
          'list': ColourModelTutorial.pPurple,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pBluePurpleDisList,
        },
      ],
      [
        {
          'name': 'teal',
          'list': ColourModelTutorial.pTeal,
        },
        {
          'name': 'grey',
          'list': ColourModelTutorial.pDarkGrey,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pPinkGreyDisList,
        },
      ],
      [
        {
          'name': 'red',
          'list': ColourModelTutorial.pRed,
        },
        {
          'name': 'brown',
          'list': ColourModelTutorial.pBrown,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pYellowGreenDisList,
        },
      ],
      [
        {
          'name': 'brown',
          'list': ColourModelTutorial.pBrown,
        },
        {
          'name': 'red',
          'list': ColourModelTutorial.pRed,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pYellowGreenDisList,
        },
      ],
      [
        {
          'name': 'orange',
          'list': ColourModelTutorial.pOrange,
        },
        {
          'name': 'green',
          'list': ColourModelTutorial.pLimeGreen,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.pYellowGreenDisList,
        },
      ],
    ];
    cvdType = CvdType.protan;
    _generateGame();
  }

  ColourGameTutorial.deutan(this.maxTargetColours, this.maxConfusionColours,
      this.maxDistractorColours, this.colourPairChoiceNum, this.maxColours,
      [this.numTargetColours]) {
    confusionSet = [
      [
        {
          'name': 'brown',
          'list': ColourModelTutorial.dBrown,
        },
        {
          'name': "red",
          'list': ColourModelTutorial.dRed,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dRedBrownDisList,
        },
      ],
      [
        {
          'name': 'red',
          'list': ColourModelTutorial.dRed,
        },
        {
          'name': "brown",
          'list': ColourModelTutorial.dBrown,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dRedBrownDisList,
        },
      ],
      [
        {
          'name': 'teal',
          'list': ColourModelTutorial.dTeal,
        },
        {
          'name': 'grey',
          'list': ColourModelTutorial.dGrey,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dGreyTealDisList,
        },
      ],
      [
        {
          'name': 'grey',
          'list': ColourModelTutorial.dGrey,
        },
        {
          'name': 'teal',
          'list': ColourModelTutorial.dTeal,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dGreyTealDisList,
        },
      ],
      [
        {
          'name': 'blue',
          'list': ColourModelTutorial.dBlue,
        },
        {
          'name': 'purple',
          'list': ColourModelTutorial.dPurple,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dBluePurpleDisList,
        },
      ],
      [
        {
          'name': 'purple',
          'list': ColourModelTutorial.dPurple,
        },
        {
          'name': 'blue',
          'list': ColourModelTutorial.dBlue,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dBluePurpleDisList,
        },
      ],
      [
        {
          'name': 'pink',
          'list': ColourModelTutorial.dPink,
        },
        {
          'name': 'grey',
          'list': ColourModelTutorial.dLightGrey,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dGreyTealDisList,
        },
      ],
      [
        {
          'name': 'green',
          'list': ColourModelTutorial.dGreen,
        },
        {
          'name': "orange",
          'list': ColourModelTutorial.dOrange,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dRedBrownDisList,
        },
      ],
      [
        {
          'name': 'orange',
          'list': ColourModelTutorial.dOrange,
        },
        {
          'name': "green",
          'list': ColourModelTutorial.dGreen,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dRedBrownDisList,
        },
      ],
      [
        {
          'name': 'yellow',
          'list': ColourModelTutorial.dYellow,
        },
        {
          'name': "green",
          'list': ColourModelTutorial.dGreen2,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.dRedBrownDisList,
        },
      ],
    ];
    cvdType = CvdType.deutan;
    _generateGame();
  }

  ColourGameTutorial.tritan(this.maxTargetColours, this.maxConfusionColours,
      this.maxDistractorColours, this.colourPairChoiceNum, this.maxColours,
      [this.numTargetColours]) {
    confusionSet = [
      [
        {
          'name': 'green',
          'list': ColourModelTutorial.tGreen,
        },
        {
          'name': "blue",
          'list': ColourModelTutorial.tBlue,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tGreenBlueDisList,
        },
      ],
      [
        {
          'name': 'blue',
          'list': ColourModelTutorial.tBlue,
        },
        {
          'name': "green",
          'list': ColourModelTutorial.tGreen,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tGreenBlueDisList,
        },
      ],
      [
        {
          'name': 'orange',
          'list': ColourModelTutorial.tOrange,
        },
        {
          'name': 'pink',
          'list': ColourModelTutorial.tMagenta,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tOrangeMagentaDisList,
        },
      ],
      [
        {
          'name': 'magenta',
          'list': ColourModelTutorial.tMagenta,
        },
        {
          'name': 'orange',
          'list': ColourModelTutorial.tOrange,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tOrangeMagentaDisList,
        },
      ],
      [
        {
          'name': 'yellow',
          'list': ColourModelTutorial.tYellow,
        },
        {
          'name': 'tan',
          'list': ColourModelTutorial.tTan,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tYellowTanDisList,
        },
      ],
      [
        {
          'name': 'tan',
          'list': ColourModelTutorial.tTan,
        },
        {
          'name': 'yellow',
          'list': ColourModelTutorial.tYellow,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tYellowTanDisList,
        },
      ],
      [
        {
          'name': 'red',
          'list': ColourModelTutorial.tDarkRed,
        },
        {
          'name': 'pink',
          'list': ColourModelTutorial.tHotPink,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tOrangeMagentaDisList,
        },
      ],
      [
        {
          'name': 'purple',
          'list': ColourModelTutorial.tPurple2,
        },
        {
          'name': 'grey',
          'list': ColourModelTutorial.tgrey,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tYellowTanDisList,
        },
      ],
      [
        {
          'name': 'grey',
          'list': ColourModelTutorial.tgrey,
        },
        {
          'name': 'purple',
          'list': ColourModelTutorial.tPurple2,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tYellowTanDisList,
        },
      ],
      [
        {
          'name': 'teal',
          'list': ColourModelTutorial.tTeal,
        },
        {
          'name': "green",
          'list': ColourModelTutorial.tGreen,
        },
        {
          'name': "distractor",
          'list': ColourModelTutorial.tGreenBlueDisList,
        },
      ],
    ];
    cvdType = CvdType.tritan;
    _generateGame();
  }

  _generateGame() {
    colourSet = [];
    Random random = Random();
    //int tempTar = random.nextInt(100 * (maxTargetColours + 1));
    if (numTargetColours == null) {
      numTargetColours =
          random.nextInt(maxTargetColours); //(tempTar/100).ceil() - 1;
    }
   // numTargetColours = 1;

    int targetColour = 0; //random.nextInt(2);
    int confusionColour = 1;
    // if (targetColour == 1) {
    //   confusionColour = 0;
    // } else {
    //   confusionColour = 1;
    // }

    targetColourName = confusionSet[colourPairChoiceNum][targetColour]['name'];
    for (int i = 0; i < numTargetColours; i++) {
      var tempList = (confusionSet[colourPairChoiceNum][targetColour]['list']
          as List<Color>);
      int valToadd = random.nextInt(tempList.length);
      colourSet.add(tempList[valToadd]);
    }
    targetColor = colourSet[0];
    int numConfusionColours =
        maxConfusionColours; //+ (maxTargetColours - numTargetColours);

    for (int i = 0; i < numConfusionColours; i++) {
      var tempList = (confusionSet[colourPairChoiceNum][confusionColour]['list']
          as List<Color>);
      int valToadd = random.nextInt(tempList.length);
      colourSet.add(tempList[valToadd]);
    }

    int numDistractorColours =
        maxColours - (numConfusionColours + numTargetColours);
    for (var i = 0; i < numDistractorColours; i++) {
      var tempList =
          (confusionSet[colourPairChoiceNum][2]['list'] as List<Color>);
      var index = random.nextInt(tempList.length);
      colourSet.add(tempList[index]);
    }

    colourSet.shuffle();
    for (var i = 0; i < colourSet.length; i++) {
      if (targetColourName == 'red') {
        if (cvdType == CvdType.protan) {
          if(ColourModelTutorial.pRed.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModelTutorial.dRed.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if(ColourModelTutorial.tDarkRed.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'brown') {
        if (cvdType == CvdType.protan) {
          if(ColourModelTutorial.pBrown.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModelTutorial.dBrown.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModelTutorial.tB.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'teal') {
        if (cvdType == CvdType.protan) {
          if(ColourModelTutorial.pTeal.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModelTutorial.dTeal.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if(ColourModelTutorial.tTeal.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'grey') {
        if (cvdType == CvdType.protan) {
          if (ColourModelTutorial.pGrey.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModelTutorial.dGrey.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if(ColourModelTutorial.tgrey.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'green') {
        if (cvdType == CvdType.protan) {
          if (ColourModelTutorial.pGreen.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModelTutorial.dGreen.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if (ColourModelTutorial.tGreen.contains(colourSet[i]))
            indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'yellow') {
        if (cvdType == CvdType.protan) {
          if (ColourModelTutorial.pYellow.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if(ColourModelTutorial.dYellow.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if(ColourModelTutorial.tYellow.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'blue') {
        if (cvdType == CvdType.protan) {
          if (ColourModelTutorial.pBlue.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModelTutorial.dBlue.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if (ColourModelTutorial.tBlue.contains(colourSet[i]))
            indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'purple') {
        if (cvdType == CvdType.protan) {
          if (ColourModelTutorial.pPurple.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModelTutorial.dPurple.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if(ColourModelTutorial.tPurple2.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'pink') {
        if (cvdType == CvdType.protan) {
          if (ColourModelTutorial.pPink.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if(ColourModelTutorial.dPink.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModelTutorial.tDarkRed.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'orange') {
        if (cvdType == CvdType.protan) {
          if(ColourModelTutorial.pOrange.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if(ColourModelTutorial.dOrange.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModelTutorial.tOrange.contains(colourSet[i])) indexesOfTarget.add(i);
          if (ColourModelTutorial.tOrange.contains(colourSet[i]))
            indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'tan') {
        if (cvdType == CvdType.tritan) {
          if (ColourModelTutorial.tTan.contains(colourSet[i]))
            indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'magenta') {
        if (cvdType == CvdType.tritan) {
          if (ColourModelTutorial.tMagenta.contains(colourSet[i]))
            indexesOfTarget.add(i);
        }
      }
    }
  }
}
