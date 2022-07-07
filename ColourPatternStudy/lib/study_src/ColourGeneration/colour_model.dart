import 'dart:ui';

class ColourModel {
  //Protan colour pairs

  //OLD USED IN V1 OF STUDY
  // static List<Color> pYellow = [
  //   Color(0xffe2e200),
  //   Color(0xffe9e91f),
  //   Color(0xfff1f133),
  //   Color(0xfff8f842),
  //   Color(0xffffff4f),
  // ];

  //V2 WITH BAD L CALCULATION
  // static List<Color> pYellow = [
  //   Color(0xffeadb55),
  //   Color(0xfff5f18b),
  //   Color(0xffdbd76e),
  //   Color(0xfff1e65a),
  //   Color(0xfff4f489),
  //   Color(0xffdada6c),
  //   Color(0xffdcd56e),
  //   Color(0xffdcdf57),
  //   Color(0xfff0f370),
  //   Color(0xffe8eb5c),
  // ];

  // static List<Color> pGreen = [
  //   Color(0xff9bee59),
  //   Color(0xffc8fc9a),
  //   Color(0xffb0e27d),
  //   Color(0xffa5f865),
  //   Color(0xffc9fd9c),
  //   Color(0xffb1e37e),
  //   Color(0xffafe07b),
  //   Color(0xff82f25f),
  //   Color(0xffafff72),
  //   Color(0xffa7fa68),
  // ];

  // static List<Color> pYellow = [
  //   Color(0xfff8e050),
  //   Color(0xffe0d438),
  //   Color(0xffe8e858),
  //   Color(0xfff0e458),
  //   Color(0xfff8e050),
  //   Color(0xfff0e430),
  //   Color(0xffe8ec38),
  // ];

  // static List<Color> pGreen = [
  //   Color(0xff50fc58),
  //   Color(0xffa0fc50),
  // ];

  static List<Color> pOrange = [
    Color(0xfff88c38),
    Color(0xfff87410),
    Color(0xfff07818),
    Color(0xfff89828),
  ];

  static List<Color> pGreen = [
    Color(0xff48bc40),
    Color(0xff90c848),
  ];

  //OLD USED IN V1 OF STUDY
  // static List<Color> pGreen = [
  //   Color(0xff39fc39),
  //   Color(0xff46ff46),
  //   Color(0xff51ff51),
  //   Color(0xff5cff5c),
  //   Color(0xff65ff65),
  // ];

  // Protan Yellow-Green Distractor List
  static List<Color> pYellowGreenDisList = [
    ...pBlue,
    ...pPurple,
    ...pRed,
    ...pBrown,
  ];

  //OLD V1
  // static List<Color> pPink = [
  //   Color(0xffcb9ca4),
  //   Color(0xffd0a1a9),
  //   Color(0xffd6a6af),
  //   Color(0xffdbacb4),
  //   Color(0xffe1b1b9),
  // ];

  // static List<Color> pGrey = [
  //   Color(0xffa8a8a8),
  //   Color(0xffadadad),
  //   Color(0xffb2b2b2),
  //   Color(0xffb8b8b8),
  //   Color(0xffbdbdbd),
  // ];

  //V2 BAD L VAL Colors
  // static List<Color> pPink = [
  //   Color(0xffbb7788),
  //   Color(0xffc68293),
  //   Color(0xffbd7182),
  //   Color(0xffd5899a),
  //   Color(0xffb9767f),
  //   Color(0xffc5828b),
  //   Color(0xffd994a4),
  //   Color(0xffbb7888),
  //   Color(0xffc88494),
  // ];

  // static List<Color> pGrey = [
  //   Color(0xff8a8a8a),
  //   Color(0xff959595),
  //   Color(0xff878787),
  //   Color(0xff9f9f9f),
  //   Color(0xff888888),
  //   Color(0xff949494),
  //   Color(0xffa7a7a7),
  //   Color(0xff8b8b8b),
  //   Color(0xff979797),
  // ];

  static List<Color> pRed = [
    Color(0xffb80020),
    Color(0xffc00000),
    Color(0xffd02020),
    Color(0xfff02428),
    Color(0xffa80018),
    Color(0xfff82c28),
    Color(0xffd81420),
  ];

  static List<Color> pBrown = [
    Color(0xff785028),
    Color(0xff805800),
    Color(0xff806428),
    Color(0xff907438),
    Color(0xff685028),
    Color(0xffa87038),
    Color(0xffa07838),
    Color(0xffa06038),
  ];

  // Protan Yellow-Green Distractor List
  static List<Color> pPinkGreyDisList = [
    ...pOrange,
    ...pGreen,
    ...pBlue,
    ...pPurple,
  ];

  //OLD V1
  // static List<Color> pBlue = [
  //   Color(0xff2a2ae8),
  //   Color(0xff3636e8),
  //   Color(0xff3f3fea),
  //   Color(0xff4848ed),
  //   Color(0xff5050f0),
  // ];

  // static List<Color> pPurple = [
  //   Color(0xff8700d5),
  //   Color(0xff8a00d6),
  //   Color(0xff8e00d9),
  //   Color(0xff921add),
  //   Color(0xff972be1),
  // ];

  // V2 BAD L CALC colors
  // static List<Color> pBlue = [
  //   Color(0xff0075a5),
  //   Color(0xff3993c3),
  //   Color(0xff507acc),
  //   Color(0xff5d84d6),
  //   Color(0xff123758),
  //   Color(0xff0c3556),
  //   Color(0xff264e81),
  //   Color(0xff213149),
  //   Color(0xff162942),
  // ];

  // static List<Color> pPurple = [
  //   Color(0xff885b9b),
  //   Color(0xff9d7fb1),
  //   Color(0xff9268c4),
  //   Color(0xffb767c5),
  //   Color(0xff4b294b),
  //   Color(0xff442948),
  //   Color(0xff633a84),
  //   Color(0xff442350),
  //   Color(0xff401940),
  // ];

  static List<Color> pBlue = [
    Color(0xff0018a0),
    Color(0xff305cc0),
    Color(0xff002870),
    Color(0xff0088c0),
  ];

  static List<Color> pPurple = [
    Color(0xff600078),
    Color(0xff580c80),
    Color(0xff981c98),
    Color(0xff580058),
    Color(0xff9864a8),
  ];

  // Protan Blue-Purple Distractor List
  static List<Color> pBluePurpleDisList = [
    ...pOrange,
    ...pGreen,
    ...pRed,
    ...pBrown,
  ];

  //Deutan Colour Pairs

  static List<Color> dGreen = [
    Color(0xff386418),
    Color(0xff008028),
    Color(0xff003000),
    Color(0xff004000),
  ];

  static List<Color> dBrown = [
    Color(0xff785028),
    Color(0xff806428),
    Color(0xff907438),
    Color(0xff402810),
    Color(0xff804418),
    Color(0xff887040),
    Color(0xffa06038),
    Color(0xff502810),
  ];

  // static List<Color> dOrange = [
  //   Color(0xfff87950),
  //   Color(0xfff49947),
  //   Color(0xfff07d4b),
  //   Color(0xffff9443),
  //   Color(0xffff9569),
  //   Color(0xffff8a5b),
  //   Color(0xffff8c67),
  //   Color(0xffff8c67),
  //   Color(0xffffb465),
  // ];

  // static List<Color> dGreen = [
  //   Color(0xff00b835),
  //   Color(0xff53c614),
  //   Color(0xff7bab3c),
  //   Color(0xff16cc16),
  //   Color(0xff1dd257),
  //   Color(0xff28d234),
  //   Color(0xff90c35d),
  //   Color(0xff90c35d),
  //   Color(0xff8cde42),
  // ];

  // Deutan Red-Brown Distractor List
  static List<Color> dRedBrownDisList = [
    ...dPink,
    ...dGrey,
    ...dBlue,
    ...dPurple,
  ];
  //OLD
  // static List<Color> dGrey = [
  //   Color(0xff666d74),
  //   Color(0xff6c737a),
  //   Color(0xff727980),
  //   Color(0xff798087),
  //   Color(0xff7f868d),
  // ];

  // static List<Color> dTeal = [
  //   Color(0xff337676),
  //   Color(0xff3b7c7c),
  //   Color(0xff438383),
  //   Color(0xff4b8989),
  //   Color(0xff528f8f),
  // ];

  // static List<Color> dGrey = [
  //   Color(0xff8b8b8b),
  //   Color(0xff8e8f8f),
  //   Color(0xff797979),
  //   Color(0xff9e9e9e),
  //   Color(0xff858585),
  //   Color(0xff959595),
  //   Color(0xff9d9d9d),
  //   Color(0xff8a8a8a),
  //   Color(0xff898989),
  //   Color(0xff949494),
  // ];

  // static List<Color> dPink = [
  //   Color(0xffc27294),
  //   Color(0xffd66b9f),
  //   Color(0xffce4487),
  //   Color(0xffcf8b9b),
  //   Color(0xffc66596),
  //   Color(0xffcc8090),
  //   Color(0xffe47ca5),
  //   Color(0xffbc7496),
  //   Color(0xffd86091),
  //   Color(0xffe569a5)
  // ];

  static List<Color> dGrey = [
    Color(0xff909490),
    Color(0xff989498),
  ];

  static List<Color> dPink = [
    Color(0xfff870a8),
    Color(0xfff860a8),
    Color(0xfff86cb0),
  ];

  // static List<Color> dOrange = [
  //   Color(0xffd85400),
  //   Color(0xffd86000),
  //   Color(0xffe05400),
  // ];

  // static List<Color> dRed = [
  //   Color(0xfff80020),
  //   Color(0xfff82c28),
  //   Color(0xfff82820),
  //   Color(0xfff80c00),
  // ];

  // Deutan Green-Brown Distractor List
  static List<Color> dGreyTealDisList = [
    ...dBrown,
    ...dGreen,
    ...dBlue,
    ...dPurple,
  ];

  // static List<Color> dBlue = [
  //   Color(0xff2a8abb),
  //   Color(0xff537cce),
  //   Color(0xff314c6b),
  //   Color(0xff43479b),
  //   Color(0xff445c7a),
  //   Color(0xff264e81),
  //   Color(0xff436395),
  //   Color(0xff213149),
  // ];

  // static List<Color> dPurple = [
  //   Color(0xffb85ec8),
  //   Color(0xffac56df),
  //   Color(0xff6b366b),
  //   Color(0xff7e20a1),
  //   Color(0xff6e4d81),
  //   Color(0xff6a387e),
  //   Color(0xff755597),
  //   Color(0xff442350),
  // ];

  static List<Color> dBlue = [
    Color(0xff002870),
    Color(0xff002c50),
    Color(0xff3864a0),
    Color(0xff305cc0),
  ];

  static List<Color> dPurple = [
    Color(0xff580c80),
    Color(0xff580058),
    Color(0xffa844b8),
    Color(0xffa020b0),
    Color(0xff980cd0),
  ];

  // Deutan Grey-Pink Distractor List
  static List<Color> dBluePurpleDisList = [
    ...dBrown,
    ...dGreen,
    ...dPink,
    ...dGrey,
  ];

  //Tritan Colour Pairs

  static List<Color> tYellow = [
    Color(0xffd0d000),
    Color(0xffd7d700),
    Color(0xffdede00),
    Color(0xffe5e50c),
    Color(0xffeded29),
  ];
  static List<Color> tTan = [
    Color(0xffddc6aa),
    Color(0xffe4cdb1),
    Color(0xffebd4b8),
    Color(0xfff2dbbf),
    Color(0xfff9e2c6),
  ];

  // Tritan Yellow-Tan Distractor List
  static List<Color> tYellowTanDisList = [
    Color(0xfff62df6),
    Color(0xfffc3bfc),
    Color(0xffff47ff),
    Color(0xffff52ff),
    Color(0xffff5cff),
    Color(0xffdd7600),
    Color(0xffe47c00),
    Color(0xffec8313),
    Color(0xfff48926),
    Color(0xfffb9033),
    Color(0xff006000),
    Color(0xff006600),
    Color(0xff006d00),
    Color(0xff107310),
    Color(0xff1d791d),
    Color(0xff2c2ce8),
    Color(0xff3737e8),
    Color(0xff4141ea),
    Color(0xff4949ed),
    Color(0xff5151f1),
  ];

  static List<Color> tGreen = [
    Color(0xff006000),
    Color(0xff006600),
    Color(0xff006d00),
    Color(0xff107310),
    Color(0xff1d791d),
  ];

  static List<Color> tBlue = [
    Color(0xff2c2ce8),
    Color(0xff3737e8),
    Color(0xff4141ea),
    Color(0xff4949ed),
    Color(0xff5151f1),
  ];

  // Tritan Blue-Green Distractor List
  static List<Color> tGreenBlueDisList = [
    Color(0xfff62df6),
    Color(0xfffc3bfc),
    Color(0xffff47ff),
    Color(0xffff52ff),
    Color(0xffff5cff),
    Color(0xffdd7600),
    Color(0xffe47c00),
    Color(0xffec8313),
    Color(0xfff48926),
    Color(0xfffb9033),
    Color(0xffddc6aa),
    Color(0xffe4cdb1),
    Color(0xffebd4b8),
    Color(0xfff2dbbf),
    Color(0xfff9e2c6),
    Color(0xffd0d000),
    Color(0xffd7d700),
    Color(0xffdede00),
    Color(0xffe5e50c),
    Color(0xffeded29),
  ];

  static List<Color> tMagenta = [
    Color(0xfff62df6),
    Color(0xfffc3bfc),
    Color(0xffff47ff),
    Color(0xffff52ff),
    Color(0xffff5cff),
  ];

  static List<Color> tOrange = [
    Color(0xffdd7600),
    Color(0xffe47c00),
    Color(0xffec8313),
    Color(0xfff48926),
    Color(0xfffb9033),
  ];

  // Tritan DarkRed-Orange Distractor List
  static List<Color> tOrangeMagentaDisList = [
    Color(0xffddc6aa),
    Color(0xffe4cdb1),
    Color(0xffebd4b8),
    Color(0xfff2dbbf),
    Color(0xfff9e2c6),
    Color(0xffd0d000),
    Color(0xffd7d700),
    Color(0xffdede00),
    Color(0xffe5e50c),
    Color(0xffeded29),
    Color(0xff006000),
    Color(0xff006600),
    Color(0xff006d00),
    Color(0xff107310),
    Color(0xff1d791d),
    Color(0xff2c2ce8),
    Color(0xff3737e8),
    Color(0xff4141ea),
    Color(0xff4949ed),
    Color(0xff5151f1),
  ];
}
