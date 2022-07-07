import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_picker/languages.dart';
import 'package:observationStudyScaffold/pages/custom_route.dart';
import 'package:observationStudyScaffold/study_src/StudyData/colour_task_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/pre_study_questionnaire_data.dart';
import 'package:observationStudyScaffold/study_src/StudyData/provider_data.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:provider/provider.dart';
import 'package:language_picker/language_picker.dart';

class PreStudyQuestionnaire extends StatefulWidget {
  final Function onNext;
  //final int treatment;
  PreStudyQuestionnaire({
    @required this.onNext,
    //@required this.treatment,
  });

  @override
  _PreStudyQuestionnaireState createState() => _PreStudyQuestionnaireState();
}

class _PreStudyQuestionnaireState extends State<PreStudyQuestionnaire> {
  int participation = -1;
  int cvdType = -1;
  int approximateAge = -1;
  int device = -1;
  int mouse = -1;
  int environment = -1;
  int lighting = -1;
  int brightness = 0;
  int recoloring = -1;
  int sex = -1;
  int severity = -1;

  TextEditingController idController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
  }

  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }

  Future<int> updateTreatmentList(String cvd) async {
    var db = FirebaseFirestore.instance;

    int treatment = 0;
    DocumentReference ref;
    if (cvd == "None") {
      ref = db.collection("CVDSimCond").doc("UAc19LETv9HoFHEkLJ2t");
    } else {
      return treatment;
    }

    try {
      await db.runTransaction((t) async {
        final doc = await t.get(ref);
        final data = doc?.data();
        if (data != null) {
          var treatmentList = List<int>.from(data['condition']) ?? [];
          if (treatmentList.isEmpty) {
            treatment = 0;
            data['condition'] = [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19
            ];
            t.update(ref, data);
          } else {
            treatment = treatmentList.removeAt(0);
            data['condition'] = treatmentList;
            t.update(ref, data);
          }
        }
      });
    } catch (e) {
      // print("Transaction failure: $e");
    }
    return treatment;
  }

  Future<int> getInfoCondition(String cvd) async {
    var db = FirebaseFirestore.instance;

    int treatment = 0;
    // DocumentReference ref;
    // if (cvd == "None") {
    //   ref = db.collection("SimInfoCondition").doc("Tw7In3d88brOe8WvNLWn");
    // } else {
    //   return treatment;
    // }

    // try {
    //   await db.runTransaction((t) async {
    //     final doc = await t.get(ref);
    //     final data = doc?.data();
    //     if (data != null) {
    //       var treatmentList = List<int>.from(data['condition']) ?? [];
    //       if (treatmentList.isEmpty) {
    //         treatment = 0;
    //         data['condition'] = [
    //           1,
    //           2,
    //         ];
    //         t.update(ref, data);
    //       } else {
    //         treatment = treatmentList.removeAt(0);
    //         data['condition'] = treatmentList;
    //         t.update(ref, data);
    //       }
    //     }
    //   });
    // } catch (e) {
    //   //print("Transaction failure: $e");
    // }
    return treatment;
  }

  Language _selectedDropdownLanguage = Languages.english;
  Language _selectedDialogLanguage = Languages.korean;
  Language _selectedCupertinoLanguage = Languages.korean;
  TextEditingController _controller = new TextEditingController();
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    //ColourTaskData colourTaskData = widget.ctx.watch<ColourTaskData>();
    //final colourTaskData = Provider.of<ColourTaskData>(context);
    FocusScopeNode currentFocus = FocusScope.of(context);
    var appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: FittedBox(
        child: SelectableText(
          'Pre-Study Questionnaire',
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

    double height =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "1. Have you participated in this study already?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 1000,
                              minWidth: 300,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ListTile(
                                      //leading: Icon(Icons.circle),
                                      title: Text(
                                        "Yes",
                                        textAlign: TextAlign.center,
                                      ),

                                      tileColor: participation == 0
                                          ? Colors.grey
                                          : Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          participation = 0;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "No",
                                        textAlign: TextAlign.center,
                                      ),
                                      tileColor: participation == 1
                                          ? Colors.grey
                                          : Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          participation = 1;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "2. What is your sex?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Column(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Male",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: sex == 0
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              sex = 0;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Female",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: sex == 1
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              sex = 1;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Intersex",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: sex == 2
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              sex = 2;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Prefer not to say",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: sex == 3
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              sex = 3;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "3. What type of Colour Blindness do you have?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Column(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Protanopia/Protanomaly",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: cvdType == 0
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              cvdType = 0;
                                              severity = -1;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Deuteranopia/Deuteranomaly",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: cvdType == 1
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              cvdType = 1;
                                              severity = -1;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Tritanopia/Tritanomaly",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: cvdType == 2
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              cvdType = 2;
                                              severity = -1;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Monochromacy/Achromatomaly",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: cvdType == 3
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              cvdType = 3;
                                              severity = -1;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              "None",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          tileColor: cvdType == 4
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              cvdType = 4;
                                              severity = 3;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   child: Container(
                                    //     decoration: BoxDecoration(
                                    //       border:
                                    //           Border.all(color: Colors.black),
                                    //     ),
                                    //     child: ListTile(
                                    //       title: TextField(
                                    //         //"Other",
                                    //         maxLines: 1,
                                    //         controller: _controller,
                                    //         //focusNode: currentFocus,
                                    //         decoration: InputDecoration(
                                    //           border: OutlineInputBorder(),
                                    //           labelText: 'Other',
                                    //           fillColor: Colors.white,
                                    //           filled: true,
                                    //         ),
                                    //         onTap: () {
                                    //           setState(() {
                                    //             cvdType = 5;
                                    //             _enabled = true;
                                    //           });
                                    //         },
                                    //         //textAlign: ,
                                    //         textAlign: TextAlign.center,
                                    //       ),
                                    //       tileColor: cvdType == 5
                                    //           ? Colors.grey
                                    //           : Colors.transparent,
                                    //       onTap: () {
                                    //         setState(() {
                                    //           cvdType = 5;
                                    //         });
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (cvdType != -1 && cvdType != 4) _severityQuestion(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "4. What is your approximate age?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Column(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "less than 18",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: approximateAge == 0
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              approximateAge = 0;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "18-24",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: approximateAge == 1
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              approximateAge = 1;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "25-34",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: approximateAge == 2
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              approximateAge = 2;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "35-44",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: approximateAge == 3
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              approximateAge = 3;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "45-64",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: approximateAge == 4
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              approximateAge = 4;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "greater than 65",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: approximateAge == 5
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              approximateAge = 5;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "5. What type of device are you using to complete this study?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Column(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Mobile Phone",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: device == 0
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              device = 0;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Laptop",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: device == 1
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              device = 1;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Tablet",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: device == 2
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              device = 2;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Monitor/Desktop",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: device == 3
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              device = 3;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Other",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: device == 4
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              device = 4;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "6. Are you using a computer mouse to complete this study?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 1000,
                              minWidth: 300,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "Yes",
                                        textAlign: TextAlign.center,
                                      ),
                                      tileColor: mouse == 0
                                          ? Colors.grey
                                          : Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          mouse = 0;
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "No",
                                        textAlign: TextAlign.center,
                                      ),
                                      tileColor: mouse == 1
                                          ? Colors.grey
                                          : Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          mouse = 1;
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "7. What environment are you taking the survey in?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 1000,
                              minWidth: 300,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "Indoor",
                                        textAlign: TextAlign.center,
                                      ),
                                      tileColor: environment == 0
                                          ? Colors.grey
                                          : Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          environment = 0;
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "Outdoor",
                                        textAlign: TextAlign.center,
                                      ),
                                      tileColor: environment == 1
                                          ? Colors.grey
                                          : Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          environment = 1;
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "8. What is the type of light of the environment you are currently in?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Column(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Artificial Light",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: lighting == 0
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              lighting = 0;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Natural Light",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: lighting == 1
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              lighting = 1;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 1000,
                                  minWidth: 300,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Don't Know",
                                            textAlign: TextAlign.center,
                                          ),
                                          tileColor: lighting == 2
                                              ? Colors.grey
                                              : Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              lighting = 2;
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "9. What is the level of brightness of your screen?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          ConstrainedBox(
                            //minwidth: 250,
                            constraints: BoxConstraints(
                              minWidth: 250,
                              maxWidth: 500,
                            ),
                            child: Slider(
                              value: brightness.toDouble(),
                              max: 100,
                              min: 0,
                              label: brightness.toString(),
                              onChanged: (val) {
                                setState(() {
                                  brightness = val.toInt();
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "10. What is your native language?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          ConstrainedBox(
                            //minwidth: 250,
                            constraints: BoxConstraints(
                              minWidth: 250,
                              maxWidth: 500,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: LanguagePickerDropdown(
                                initialValue: Languages.english,
                                itemBuilder: _buildDropdownItem,
                                onValuePicked: (Language language) {
                                  _selectedDropdownLanguage = language;
                                  // print(_selectedDropdownLanguage.name);
                                  // print(_selectedDropdownLanguage.isoCode);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          SelectableText(
                            "11. Are you using any software that could change the colours on your computer display (e.g., recolouring software or nightmode/flux)?",
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 1000,
                              minWidth: 300,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ListTile(
                                      //leading: Icon(Icons.circle),
                                      title: Text(
                                        "Yes",
                                        textAlign: TextAlign.center,
                                      ),

                                      tileColor: recoloring == 0
                                          ? Colors.grey
                                          : Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          recoloring = 0;
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "No",
                                        textAlign: TextAlign.center,
                                      ),
                                      tileColor: recoloring == 1
                                          ? Colors.grey
                                          : Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          recoloring = 1;
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 12.0),
                    //   child: Column(
                    //     children: [
                    //       SelectableText(
                    //         "12. Please enter your 4-digit code:",
                    //         showCursor: true,
                    //         toolbarOptions: ToolbarOptions(
                    //           copy: true,
                    //           selectAll: true,
                    //         ),
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           fontSize: 30,
                    //         ),
                    //       ),
                    //       ConstrainedBox(
                    //         constraints: BoxConstraints(
                    //           maxWidth: 1000,
                    //           minWidth: 300,
                    //         ),
                    //         child: Row(
                    //           children: [
                    //             Expanded(
                    //               child: Container(
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(color: Colors.black),
                    //                 ),
                    //                 child: TextFormField(
                    //                   controller: idController,
                    //                   onChanged: (_) {
                    //                     setState(() {
                                          
                    //                     });
                    //                   },
                    //                   textAlign: TextAlign.center,
                    //                   inputFormatters: [
                    //                   LengthLimitingTextInputFormatter(4),
                    //                   FilteringTextInputFormatter.digitsOnly
                    //                 ]),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 250,
                        maxWidth: 500,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Provider<ColourTaskData>(
                          create: (context) => colourTaskData,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  DesignTheme.defaultRadiusVal),
                            ),
                            color: (participation == -1 ||
                                    //idController.text.length != 4 ||
                                    severity == -1 ||
                                    sex == -1 ||
                                    cvdType == -1 ||
                                    approximateAge == -1 ||
                                    device == -1 ||
                                    mouse == -1 ||
                                    environment == -1 ||
                                    lighting == -1 ||
                                    recoloring == -1)
                                ? Colors.grey
                                : DesignTheme.primaryColor,
                            onPressed: (participation == -1 ||
                                    //idController.text.length != 4 ||
                                    sex == -1 ||
                                    severity == -1 ||
                                    cvdType == -1 ||
                                    approximateAge == -1 ||
                                    device == -1 ||
                                    mouse == -1 ||
                                    environment == -1 ||
                                    lighting == -1 ||
                                    recoloring == -1)
                                ? () {}
                                : () {
                                    String participantSex;
                                    String cvdSeverity;

                                    if (severity == 0) {
                                      cvdSeverity = "mild";
                                    } else if (severity == 1) {
                                      cvdSeverity = "moderate";
                                    } else if (severity == 2) {
                                      cvdSeverity = "strong";
                                    } else {
                                      cvdSeverity = "n/a";
                                    }

                                    if (sex == 0) {
                                      participantSex = "male";
                                    } else if (sex == 1) {
                                      participantSex = "female";
                                    } else if (sex == 2) {
                                      participantSex = "intersex";
                                    } else {
                                      participantSex = "prefer not to say";
                                    }

                                    bool alreadyParticipated;
                                    if (participation == 0)
                                      alreadyParticipated = true;
                                    else
                                      alreadyParticipated = false;
                                    String cvd;
                                    if (cvdType == 0)
                                      cvd = "Protan";
                                    else if (cvdType == 1)
                                      cvd = "Deutan";
                                    else if (cvdType == 2)
                                      cvd = "Tritan";
                                    else if (cvdType == 3)
                                      cvd = "Monochromacy";
                                    else
                                      cvd = "None";
                                    String environ;
                                    if (environment == 0)
                                      environ = "Indoor";
                                    else
                                      environ = "Outdoor";
                                    String light;
                                    if (lighting == 0)
                                      light = "Artificial";
                                    else if (lighting == 1)
                                      light = "Natural";
                                    else
                                      light = "Don't Know";

                                    String otherStr = _controller.text ?? "N/A";

                                    colourTaskData.setPreStudyQuestionnaireData(
                                      PreStudyQuestionnaireData(
                                        alreadyParticipated:
                                            alreadyParticipated,
                                        cvdType: cvd,
                                        ageGroup: approximateAge,
                                        deviceCode: device,
                                        usingMouse: mouse == 0,
                                        environment: environ,
                                        lighting: light,
                                        brightness: brightness,
                                        recoloring: recoloring == 0,
                                        nativeLanguage:
                                            _selectedDropdownLanguage.name,
                                        otherStr: otherStr,
                                        sex: participantSex,
                                        severity: cvdSeverity,
                                        //id: idController.text,
                                      ),
                                    );
                                    //TODO: GENERATE TREATMENT
                                    //colourTaskData.treatment = widget.treatment;
                                    if (recoloring == 0) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: SelectableText(
                                                'Turn off Recoloring Software',
                                                showCursor: true,
                                                toolbarOptions: ToolbarOptions(
                                                  copy: true,
                                                  selectAll: true,
                                                ),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                              content: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxHeight: 300,
                                                  minWidth: 300,
                                                  maxWidth: 500,
                                                  minHeight: 300,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SelectableText.rich(
                                                      TextSpan(
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  'Before proceeding, please '),
                                                          TextSpan(
                                                              text: 'disable ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  'any software that alters on-screen colours (e.g., f.lux, MacOS Night Shift, Windows equivalent, or any assistive CVD filters), as these will invalidate your results. Once you have done this, please continue below.'),
                                                        ],
                                                      ),
                                                      showCursor: true,
                                                      toolbarOptions:
                                                          ToolbarOptions(
                                                        copy: true,
                                                        selectAll: true,
                                                      ),
                                                    ),
                                                    RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(DesignTheme
                                                                .defaultRadiusVal),
                                                      ),
                                                      color: DesignTheme
                                                          .primaryColor,
                                                      onPressed: () {
                                                        updateTreatmentList(cvd)
                                                            .then((treatment) {
                                                          getInfoCondition(cvd)
                                                              .then(
                                                                  (cvdInfoTreatment) {
                                                            colourTaskData
                                                                    .treatment =
                                                                treatment;
                                                            colourTaskData
                                                                    .cvdSimInfo =
                                                                cvdInfoTreatment;
                                                            Navigator.of(
                                                                    context)
                                                                .pushReplacement(
                                                                    CustomRoute(
                                                                        builder:
                                                                            (context) {
                                                              return widget.onNext(
                                                                  colourTaskData
                                                                      .treatment);
                                                            }));
                                                          });

                                                          //colourTaskData.treatment = 3;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            DesignTheme
                                                                .smallPadding),
                                                        child: FittedBox(
                                                          child: Text(
                                                            'Continue',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    } else {
                                      updateTreatmentList(cvd)
                                          .then((treatment) {
                                        getInfoCondition(cvd)
                                            .then((cvdInfoTreatment) {
                                          colourTaskData.treatment = treatment;
                                          colourTaskData.cvdSimInfo =
                                              cvdInfoTreatment;
                                          Navigator.of(context).pushReplacement(
                                              CustomRoute(builder: (context) {
                                            return widget.onNext(
                                                colourTaskData.treatment,
                                                colourTaskData.cvdSimInfo);
                                          }));
                                        });

                                        ///colourTaskData.treatment = 3;
                                      });
                                    }

                                    //db.collection('cities').doc('SF');
                                    // [1, 2, 3];
                                    // [0, 1, 2, 3];

                                    //widget.onNext();
                                  },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: DesignTheme.mediumPadding),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: FittedBox(
                                  child: Text(
                                    'Submit',
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _severityQuestion() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [
          SelectableText(
            "3.5. What is your severity level?",
            showCursor: true,
            toolbarOptions: ToolbarOptions(
              copy: true,
              selectAll: true,
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 1000,
                  minWidth: 300,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: ListTile(
                          title: Text(
                            "Mild",
                            textAlign: TextAlign.center,
                          ),
                          tileColor:
                              severity == 0 ? Colors.grey : Colors.transparent,
                          onTap: () {
                            setState(() {
                              severity = 0;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: ListTile(
                          title: Text(
                            "Moderate",
                            textAlign: TextAlign.center,
                          ),
                          tileColor:
                              severity == 1 ? Colors.grey : Colors.transparent,
                          onTap: () {
                            setState(() {
                              severity = 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 1000,
                  minWidth: 300,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: ListTile(
                          title: Text(
                            "Strong",
                            textAlign: TextAlign.center,
                          ),
                          tileColor:
                              severity == 2 ? Colors.grey : Colors.transparent,
                          onTap: () {
                            setState(() {
                              severity = 2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // void _openLanguagePickerDialog() => showDialog(
  //       context: context,
  //       builder: (context) => Theme(
  //           data: Theme.of(context).copyWith(primaryColor: Colors.pink),
  //           child: LanguagePickerDialog(
  //               titlePadding: EdgeInsets.all(8.0),
  //               searchCursorColor: Colors.pinkAccent,
  //               searchInputDecoration: InputDecoration(hintText: 'Search...'),
  //               isSearchable: true,
  //               title: Text('Select your language'),
  //               onValuePicked: (Language language) => setState(() {
  //                     _selectedDialogLanguage = language;
  //                     print(_selectedDialogLanguage.name);
  //                     print(_selectedDialogLanguage.isoCode);
  //                   }),
  //               itemBuilder: _buildDialogItem)),
  //     );

  // Widget _buildDialogItem(Language language) => Row(
  //       children: <Widget>[
  //         Text(language.name),
  //         SizedBox(width: 8.0),
  //         Flexible(child: Text("(${language.isoCode})"))
  //       ],
  //     );
  // Widget _buildDialogItem(Language language) => Row(
  //       children: <Widget>[
  //         Text(language.name),
  //         SizedBox(width: 8.0),
  //         Flexible(child: Text("(${language.isoCode})"))
  //       ],
  //     );

  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }
}
