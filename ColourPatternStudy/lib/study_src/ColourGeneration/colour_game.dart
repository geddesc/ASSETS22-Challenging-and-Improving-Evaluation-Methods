import 'dart:ui';
import 'dart:math';

import 'package:observationStudyScaffold/models/cvd_type.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_model.dart';

class ColourGame {
  int maxTargetColours;
  int maxConfusionColours;
  int maxDistractorColours;
  int numTargetColours;
  int colourPairChoiceNum;
  String targetColourName;
  int numberOfTargetColours;
  List<List<Map<String, Object>>> confusionSet;
  List<Color> confusionColourList = [];
  List<Color> distactorColourList = [];
  List<Color> targetColourList = [];
  int maxColours;
  CvdType cvdType;

  List<Color> colourSet = [];

  List<Color> get generatedColours {
    return colourSet;
  }

  //List<int> targetColoursList = [];
  List<int> indexesOfTarget = [];

  ColourGame.protan(this.maxTargetColours, this.maxConfusionColours,
      this.maxDistractorColours, this.colourPairChoiceNum, this.maxColours, this.numTargetColours) {
    confusionSet = [
      [
        {
          'name': 'red',
          'list': ColourModel.pRed,
        },
        {
          'name': "brown",
          'list': ColourModel.pBrown,
        },
        {
          'name': "distractor",
          'list': ColourModel.pPinkGreyDisList,
        },
      ],
      [
        {
          'name': 'orange',
          'list': ColourModel.pOrange,
        },
        {
          'name': 'green',
          'list': ColourModel.pGreen,
        },
        {
          'name': "distractor",
          'list': ColourModel.pYellowGreenDisList,
        },
      ],
      [
        {
          'name': 'blue',
          'list': ColourModel.pBlue,
        },
        {
          'name': 'purple',
          'list': ColourModel.pPurple,
        },
        {
          'name': "distractor",
          'list': ColourModel.pBluePurpleDisList,
        },
      ],
    ];
    cvdType = CvdType.protan;
    _generateGame();
  }

  ColourGame.deutan(this.maxTargetColours, this.maxConfusionColours,
      this.maxDistractorColours, this.colourPairChoiceNum, this.maxColours, this.numTargetColours) {
    confusionSet = [
      [
        {
          'name': 'green',
          'list': ColourModel.dGreen,
        },
        {
          'name': "brown",
          'list': ColourModel.dBrown,
        },
        {
          'name': "distractor",
          'list': ColourModel.dRedBrownDisList,
        },
      ],
      [
        {
          'name': 'pink',
          'list': ColourModel.dPink,
        },
        {
          'name': 'grey',
          'list': ColourModel.dGrey,
        },
        {
          'name': "distractor",
          'list': ColourModel.dGreyTealDisList,
        },
      ],
      [
        {
          'name': 'blue',
          'list': ColourModel.dBlue,
        },
        {
          'name': 'purple',
          'list': ColourModel.dPurple,
        },
        {
          'name': "distractor",
          'list': ColourModel.dBluePurpleDisList,
        },
      ],
    ];
    cvdType = CvdType.deutan;
    _generateGame();
  }

  ColourGame.tritan(this.maxTargetColours, this.maxConfusionColours,
      this.maxDistractorColours, this.colourPairChoiceNum, this.maxColours, this.numTargetColours) {
    confusionSet = [
      [
        {'name': 'green', 'list': ColourModel.tGreen},
        {
          'name': "blue",
          'list': ColourModel.tBlue,
        },
        {
          'name': "distractor",
          'list': ColourModel.tGreenBlueDisList,
        },
      ],
      [
        {'name': 'orange', 'list': ColourModel.tOrange},
        {
          'name': 'magenta',
          'list': ColourModel.tMagenta,
        },
        {
          'name': "distractor",
          'list': ColourModel.tOrangeMagentaDisList,
        },
      ],
      [
        {'name': 'yellow', 'list': ColourModel.tYellow},
        {
          'name': 'tan',
          'list': ColourModel.tTan,
        },
        {
          'name': "distractor",
          'list': ColourModel.tYellowTanDisList,
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
    // if(numTargetColours == null) {
    //   numTargetColours =
    //     random.nextInt(maxTargetColours); //(tempTar/100).ceil() - 1;
    // }

    int targetColour = random.nextInt(2);
    int confusionColour;
    if (targetColour == 1) {
      confusionColour = 0;
    } else {
      confusionColour = 1;
    }

    

    targetColourName = confusionSet[colourPairChoiceNum][targetColour]['name'];
    for (int i = 0; i < numTargetColours; i++) {
      var tempList = (confusionSet[colourPairChoiceNum][targetColour]['list']
          as List<Color>);
      int valToadd = random.nextInt(tempList.length);
      colourSet.add(tempList[valToadd]);
      targetColourList.add(tempList[valToadd]);
    }
    int numConfusionColours =
        maxConfusionColours; //+ (maxTargetColours - numTargetColours);

    for (int i = 0; i < numConfusionColours; i++) {
      var tempList = (confusionSet[colourPairChoiceNum][confusionColour]['list']
          as List<Color>);
      int valToadd = random.nextInt(tempList.length);
      colourSet.add(tempList[valToadd]);
      confusionColourList.add(tempList[valToadd]);
    }

    int numDistractorColours =
        maxColours - (numConfusionColours + numTargetColours);
    for (var i = 0; i < numDistractorColours; i++) {
      var tempList =
          (confusionSet[colourPairChoiceNum][2]['list'] as List<Color>);
      var index = random.nextInt(tempList.length);
      colourSet.add(tempList[index]);
      distactorColourList.add(tempList[index]);
    }
    colourSet.shuffle();
    for (var i = 0; i < colourSet.length; i++) {
      if (targetColourName == 'red') {
        if (cvdType == CvdType.protan) {
          if(ColourModel.pRed.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          //if (ColourModel.dRed.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModel.tDarkRed.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'brown') {
        if (cvdType == CvdType.protan) {
          if(ColourModel.pBrown.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModel.dBrown.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModel.tB.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'teal') {
        if (cvdType == CvdType.protan) {
          //if(ColourModel.pTeal.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          // if (ColourModel.dTeal.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModel.tB.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'grey') {
        if (cvdType == CvdType.protan) {
          //if (ColourModel.pGrey.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModel.dGrey.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModel.tDarkRed.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'green') {
        if (cvdType == CvdType.protan) {
          if (ColourModel.pGreen.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if(ColourModel.dGreen.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if (ColourModel.tGreen.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'yellow') {
        if (cvdType == CvdType.protan) {
         // if (ColourModel.pYellow.contains(colourSet[i]))
          //  indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          //if(ColourModel.dY.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModel.tYellow.contains(colourSet[i])) indexesOfTarget.add(i);
          if (ColourModel.tYellow.contains(colourSet[i]))
            indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'blue') {
        if (cvdType == CvdType.protan) {
          if (ColourModel.pBlue.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModel.dBlue.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          if (ColourModel.tBlue.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'purple') {
        if (cvdType == CvdType.protan) {
          if (ColourModel.pPurple.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if (ColourModel.dPurple.contains(colourSet[i]))
            indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModel.tPurple.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'pink') {
        if (cvdType == CvdType.protan) {
         // if (ColourModel.pPink.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          if(ColourModel.dPink.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          // if(ColourModel.tDarkRed.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'orange') {
        if (cvdType == CvdType.protan) {
          if(ColourModel.pOrange.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.deutan) {
          //if(ColourModel.dOrange.contains(colourSet[i])) indexesOfTarget.add(i);
        } else if (cvdType == CvdType.tritan) {
          //if(ColourModel.tOrange.contains(colourSet[i])) indexesOfTarget.add(i);
          if (ColourModel.tOrange.contains(colourSet[i]))
            indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'tan') {
        if (cvdType == CvdType.tritan) {
          if (ColourModel.tTan.contains(colourSet[i])) indexesOfTarget.add(i);
        }
      } else if (targetColourName == 'magenta') {
        if (cvdType == CvdType.tritan) {
          if (ColourModel.tMagenta.contains(colourSet[i]))
            indexesOfTarget.add(i);
        }
        // else if(targetColourName == 'darkgreen') {
        //   if(cvdType == CvdType.protan) {
        //     if(ColourModel.pRed.contains(colourSet[i])) indexesOfTarget.add(i);
        //   } else if(cvdType == CvdType.deutan) {
        //     if(ColourModel.dRed.contains(colourSet[i])) indexesOfTarget.add(i);
        //   } else if(cvdType == CvdType.tritan){
        //     if(ColourModel.tDarkRed.contains(colourSet[i])) indexesOfTarget.add(i);
        //   }
        // }
        //  else if(targetColourName == 'darkbrown') {
        //   if(darkbrown.contains(colourSet[i])) indexesOfTarget.add(i);
        // }
        // else if(targetColourName == 'darkblue') {
        //   if(darkBlue.contains(colourSet[i])) indexesOfTarget.add(i);
        // }  else if(targetColourName == 'darkorange') {
        //   if(darkorange.contains(colourSet[i])) indexesOfTarget.add(i);
        // } else if(targetColourName == ' red ') {
        //   if(red.contains(colourSet[i])) indexesOfTarget.add(i);
        // }
      }
    }
  }
}
