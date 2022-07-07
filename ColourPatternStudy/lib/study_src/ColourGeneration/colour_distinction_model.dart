import 'dart:math';
import 'dart:ui';

import 'package:observationStudyScaffold/models/cvd_type.dart';
import 'package:observationStudyScaffold/study_src/ColourDictionary/new_colour_dictionary_list.dart';
import 'package:observationStudyScaffold/study_src/ColourGeneration/colour_distinction_set.dart';

class ColourDistinctionModel {

  int maxColours;
  CvdType cvdType;
  List<Map<String, Object>> colourList = [
    {
      "colourSet": new_col_list['red'],
      "colourName": 'red',
    },
    {
      "colourSet": new_col_list['orange'],
      "colourName": 'orange',
    },
    {
      "colourSet": new_col_list['yellow'],
      "colourName": 'yellow',
    },
    {
      "colourSet": new_col_list['green'],
      "colourName": 'green',
    },
    {
      "colourSet": new_col_list['blue'],
      "colourName": 'blue',
    },
    {
      "colourSet": new_col_list['purple'],
      "colourName": 'purple',
    },
    {
      "colourSet": new_col_list['pink'],
      "colourName": 'pink',
    },
    {
      "colourSet": new_col_list['brown'],
      "colourName": 'brown',
    },
    {
      "colourSet": new_col_list['grey'],
      "colourName": 'grey',
    },
  ];

  Map<String, bool> colourNamesInSet = {
    "red": false,
    "orange": false,
    "yellow": false,
    "green": false,
    "blue": false,
    "purple": false,
    "pink": false,
    "brown": false,
    "grey": false,
  };

  List<Color> colourSet = [];

  int numberOfColours;
  int distinctColours;
  Random rand = Random();

  ColourDistinctionModel.generateColours(this.maxColours, this.distinctColours) {
    

    numberOfColours = distinctColours; //rand.nextInt(5) + 1;

    _generateColours();
    
  }

  void _generateColours() {
    int totalRemainingColours = maxColours;
    int index;

    if(numberOfColours == 1) {
      index = rand.nextInt(colourList.length);
      List<Color> colors = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      colourList.removeAt(index); // remove the index value so no duplicates are gotten. 
      for(int i = 0; i < maxColours; i++) {
        colourSet.add(colors[rand.nextInt(colors.length)]);
      }
    } else if(numberOfColours == 2) {

      
      index = rand.nextInt(colourList.length);
      List<Color> colorsOne = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];

      for(int i = 0; i < 40; i++) {
        colourSet.add(colorsOne[rand.nextInt(colorsOne.length)]);
      }
      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsTwo = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];

      for(int i = 0; i < 40; i++) {
        colourSet.add(colorsTwo[rand.nextInt(colorsTwo.length)]);
      }
    } else if(numberOfColours == 3) {

      index = rand.nextInt(colourList.length);
      List<Color> colorsOne = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 27; i++) {
        colourSet.add(colorsOne[rand.nextInt(colorsOne.length)]);
      }
      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsTwo = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 27; i++) {
        colourSet.add(colorsTwo[rand.nextInt(colorsTwo.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsThree = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 26; i++) {
        colourSet.add(colorsThree[rand.nextInt(colorsThree.length)]);
      }

    } else if(numberOfColours == 4) {
      
      index = rand.nextInt(colourList.length);
       List<Color> colorsOne = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 20; i++) {
        colourSet.add(colorsOne[rand.nextInt(colorsOne.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsTwo = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 20; i++) {
        colourSet.add(colorsTwo[rand.nextInt(colorsTwo.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsThree = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 20; i++) {
        colourSet.add(colorsThree[rand.nextInt(colorsThree.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsFour = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 20; i++) {
        colourSet.add(colorsFour[rand.nextInt(colorsFour.length)]);
      }
    }  else if(numberOfColours == 5) {
      
      index = rand.nextInt(colourList.length);
       List<Color> colorsOne = colourList[index]['colourSet'];
       colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 16; i++) {
        colourSet.add(colorsOne[rand.nextInt(colorsOne.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsTwo = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 16; i++) {
        colourSet.add(colorsTwo[rand.nextInt(colorsTwo.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsThree = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];

      for(int i = 0; i < 16; i++) {
        colourSet.add(colorsThree[rand.nextInt(colorsThree.length)]);
      }

      colourList.removeAt(index); 


      index = rand.nextInt(colourList.length);
      List<Color> colorsFour = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 16; i++) {
        colourSet.add(colorsFour[rand.nextInt(colorsFour.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsFive = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 16; i++) {
        colourSet.add(colorsFive[rand.nextInt(colorsFive.length)]);
      }
    } else if(numberOfColours == 6) {
      
      index = rand.nextInt(colourList.length);
       List<Color> colorsOne = colourList[index]['colourSet'];
       colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 14; i++) {
        colourSet.add(colorsOne[rand.nextInt(colorsOne.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsTwo = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 14; i++) {
        colourSet.add(colorsTwo[rand.nextInt(colorsTwo.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsThree = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];

      for(int i = 0; i < 13; i++) {
        colourSet.add(colorsThree[rand.nextInt(colorsThree.length)]);
      }

      colourList.removeAt(index); 


      index = rand.nextInt(colourList.length);
      List<Color> colorsFour = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 13; i++) {
        colourSet.add(colorsFour[rand.nextInt(colorsFour.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsFive = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 13; i++) {
        colourSet.add(colorsFive[rand.nextInt(colorsFive.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsSix = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 13; i++) {
        colourSet.add(colorsSix[rand.nextInt(colorsSix.length)]);
      }


    } else if(numberOfColours == 7) {
      
      index = rand.nextInt(colourList.length);
       List<Color> colorsOne = colourList[index]['colourSet'];
       colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 12; i++) {
        colourSet.add(colorsOne[rand.nextInt(colorsOne.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsTwo = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 12; i++) {
        colourSet.add(colorsTwo[rand.nextInt(colorsTwo.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsThree = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];

      for(int i = 0; i < 12; i++) {
        colourSet.add(colorsThree[rand.nextInt(colorsThree.length)]);
      }

      colourList.removeAt(index); 


      index = rand.nextInt(colourList.length);
      List<Color> colorsFour = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 11; i++) {
        colourSet.add(colorsFour[rand.nextInt(colorsFour.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsFive = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 11; i++) {
        colourSet.add(colorsFive[rand.nextInt(colorsFive.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsSix = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 11; i++) {
        colourSet.add(colorsSix[rand.nextInt(colorsSix.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsSeven = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 11; i++) {
        colourSet.add(colorsSeven[rand.nextInt(colorsSeven.length)]);
      }

    } else if(numberOfColours == 8) {

      index = rand.nextInt(colourList.length);
       List<Color> colorsOne = colourList[index]['colourSet'];
       colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 10; i++) {
        colourSet.add(colorsOne[rand.nextInt(colorsOne.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsTwo = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 10; i++) {
        colourSet.add(colorsTwo[rand.nextInt(colorsTwo.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsThree = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];

      for(int i = 0; i < 10; i++) {
        colourSet.add(colorsThree[rand.nextInt(colorsThree.length)]);
      }

      colourList.removeAt(index); 


      index = rand.nextInt(colourList.length);
      List<Color> colorsFour = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 10; i++) {
        colourSet.add(colorsFour[rand.nextInt(colorsFour.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsFive = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 10; i++) {
        colourSet.add(colorsFive[rand.nextInt(colorsFive.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsSix = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 10; i++) {
        colourSet.add(colorsSix[rand.nextInt(colorsSix.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsSeven = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 10; i++) {
        colourSet.add(colorsSeven[rand.nextInt(colorsSeven.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsEight = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 10; i++) {
        colourSet.add(colorsEight[rand.nextInt(colorsEight.length)]);
      }
      
    } else if(numberOfColours == 9) {
      
      index = rand.nextInt(colourList.length);
       List<Color> colorsOne = colourList[index]['colourSet'];
       colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 9; i++) {
        colourSet.add(colorsOne[rand.nextInt(colorsOne.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsTwo = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 9; i++) {
        colourSet.add(colorsTwo[rand.nextInt(colorsTwo.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsThree = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];

      for(int i = 0; i < 9; i++) {
        colourSet.add(colorsThree[rand.nextInt(colorsThree.length)]);
      }

      colourList.removeAt(index); 


      index = rand.nextInt(colourList.length);
      List<Color> colorsFour = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 9; i++) {
        colourSet.add(colorsFour[rand.nextInt(colorsFour.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsFive = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 9; i++) {
        colourSet.add(colorsFive[rand.nextInt(colorsFive.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsSix = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 9; i++) {
        colourSet.add(colorsSix[rand.nextInt(colorsSix.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsSeven = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 9; i++) {
        colourSet.add(colorsSeven[rand.nextInt(colorsSeven.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsEight = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 9; i++) {
        colourSet.add(colorsEight[rand.nextInt(colorsEight.length)]);
      }

      colourList.removeAt(index); 

      index = rand.nextInt(colourList.length);
      List<Color> colorsNine = colourList[index]['colourSet'];
      colourNamesInSet[colourList[index]['colourName']] = !colourNamesInSet[colourList[index]['colourName']];
      for(int i = 0; i < 8; i++) {
        colourSet.add(colorsNine[rand.nextInt(colorsNine.length)]);
      }
    }


    colourSet.shuffle();

  }

  

}
