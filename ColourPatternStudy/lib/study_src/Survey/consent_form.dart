import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/pages/custom_route.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';

class ConsentForm extends StatelessWidget {
  final Function onNext;
  ConsentForm({
    @required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      title: FittedBox(
        child: SelectableText(
          "Consent Form",
          showCursor: true,
          toolbarOptions: ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: DesignTheme.headerFontSize,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    double height =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 1000,
                    minWidth: 300,
                  ),
                  child: Card(
                    child: ListView(
                      children: [
                        Container(
                          height: 100,
                          child: Image.asset(
                            "/images/guelphLogo.png",
                          ),
                          // child: Image.network(
                          //   "https://www.ontariouniversitiesinfo.ca/assets/files/images/universityLogoLarge_logo%20for%20ouinfo-01.png",
                          // ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                          child: SelectableText.rich(
                            TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                text: """
INFORMED CONSENT/Information Letter
Improving Evaluation Methods of Colour Vision Defiency Aids  
  """),
                            textAlign: TextAlign.center,
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 8.0, right: 8.0),
                          child: SelectableText.rich(
                            //textAlign: TextAlign.center,
                            TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              children: [
                                TextSpan(text: """
You are invited to participate in a research project. This information letter is to help you decide if you want to be involved in the project. 
You are invited to take part in a research project to evaluate the effectiveness of the evaluation methods we have built, as well as exploring the effectiveness of colour vision deficiency simulations in providing accurate results.
The purpose of this letter is to provide you with the information you require to make an informed decision on participating in this research.

"""),
                                TextSpan(
                                    text:
                                        "Who is conducting this research study?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
This research study is being conducted by Connor Geddes (geddesc@uoguelph.ca), PhD Student; under the supervision of Dr. David Flatla (dflatla@uoguelph.ca), Associate Professor, in the School of Computer Science at the University of Guelph in Guelph, Ontario, Canada.
This research is not funded by any third party.\n """),
                                TextSpan(
                                    text:
                                        "Who do I contact if I have concerns or need more information?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
Please feel free to contact Connor Geddes (geddesc@uoguelph.ca) with any questions you might have about the project.
Any questions about the research study may also be directed to Dr. David Flatla, Associate Professor (dflatla@uoguelph.ca).
"""),
                                TextSpan(
                                    text:
                                        "Are there any conflicts of interest involved?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
No member of the research team has a conflict of interest related to this study.
The results found in this study will not be commercialized. 
"""),
                                TextSpan(
                                    text:
                                        "What is this research study about?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
The purpose of this research is to determine the effectiveness of our tasks in potentially evaluating colour identification aids, as well as the effectiveness of simulations in providing accurate results.
"""),
                                TextSpan(
                                    text:
                                        "Why am I being invited to participate in this research study?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
You are invited to take part in this study if:
• You are at least 18 years of age
• You are able to read/write in English
• You have not already participated in this study
"""),
                                TextSpan(
                                    text: "What will I be asked to do?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
You are invited to participate in a 15-20-minute online session that consists of:
• a pre-study questionnaire – where we will ask you background information about yourself and details about the environment you are taking the study in. 
• a prompt letting you know if you are using a simulation for the study (only if you do not have colour vision deficiency)
• an orientation on five different colour identification tasks
• performing colour identification tasks (by selecting coloured squares) 
• performing colour arranging tasks (by rearranging coloured squares) 
• performing colour sorting tasks (by sorting coloured squares to the correct colour name) 
• performing colour distinction tasks (by determine the number of unique hues in a grid) 
• performing colour categorization tasks (by determining the corresponding category a colour belongs to by hue) 
The entire study will be hosted on Google’s Firebase service.
We will record your responses to the questionnaires as well as the accuracy and completion time for each trial.
We will not record any personally identifiable information.

"""),
                                TextSpan(
                                    text: "How long will it take?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
The study session will take approximately 15-20 minutes.
"""),
                                TextSpan(
                                    text: "What are my responsibilities?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
It is important that you keep in mind that we are evaluating our colour identification tasks – we are not evaluating you. Please try your best but keep in mind that the tasks have been made purposefully difficult. Your participation in this study is completely voluntary. If you feel you no longer wish to take part, you may quit the study at any point by closing the study browser window. Your responses and data will not be recorded if you quit prior to completion.
"""),
                                TextSpan(
                                    text:
                                        "Are there any risks or possible negative outcomes for me if I participate?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
As a result of the study, you may discover details about your colour vision that you may not have been aware of previously. If you do, we encourage you to contact your optometrist or a vision expert in order to investigate the problems you may have encountered in greater detail.
"""),
                                TextSpan(
                                    text:
                                        "What are the benefits of the research project?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• Although this research may not benefit you directly, it will help researchers understand the potential usefulness of our tasks in evaluating colour identification aids.
"""),
                                TextSpan(
                                    text:
                                        "After I agree to participate and sign the Info/consent letter, can I change my mind?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• Participation in this study is voluntary, you can change your mind at any time.
• You may refuse to participate, refuse to answer any questions or withdraw from the study with no effect on your future (care/academic/employment status, etc.).
• If you choose to withdraw before study session completion, all data collected up to that point will be destroyed and not used as part of this project.
• After the completion of the study, data cannot be withdrawn as we are not collecting any personally identifiable information, so we will be unable to identify your data.
"""),
                                TextSpan(
                                    text:
                                        "Who will know what I said or did in the study?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• Your IP address will be collected by Firebase in order to provide security to the website. The research team will in no way collect or have access to the IP address. No personally identifiable information will be collected by the research team.
• Your anonymized information (type of colour blindness, session results, and questionnaire responses) will be linked to a unique participant ID number for data processing purposes. The data you provide will be associated only with this participant ID number. While the study is running, all study data will be stored on Google’s Firebase service. After the study has completed, we will transfer the study data on to a University of Guelph secure file storage service, only accessible by the research team.
• Your anonymized information will be available through open access via the ACM digital library. 

"""),
                                TextSpan(
                                    text:
                                        "How will you protect the information I provide?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• Data collected will be stored on a Google’s Firebase service while the study is running and will be transferred to a University of Guelph secure file storage service after the completion of the study. The data stored on both Firebase and the secure file store service will only accessible by the research team. 
"""),
                                TextSpan(
                                    text:
                                        "What will you use the information you collect for?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• The data you provide will be used in our current study and may be used in future studies to answer similar research questions.
• The anonymous data collected will be shared in academic journals and conferences.
"""),
                                TextSpan(
                                    text:
                                        "Will I receive any incentives for my participation?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• You will not receive any incentives for participation in this study
"""),
                                TextSpan(
                                    text:
                                        "Will I be given new information about participation throughout the course of the project?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• The study comprises a single session, so no new information will be provided during the course of this project. 
"""),
                                TextSpan(
                                    text:
                                        "Will the study be published or otherwise disseminated?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• The research team will undertake to publish the results of the project in a conference proceeding and peer-reviewed journal
• Each participant’s anonymous data will only be associated with an anonymous participant ID. This participant ID will be associated with your responses and data.
"""),
                                TextSpan(
                                    text:
                                        "Will I receive information about the results of this research?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• After the paper has been accepted, a version of the paper will be posted on the social media sites used for recruitment for all potential participants to read. 
"""),
                                TextSpan(
                                    text:
                                        "What are my rights as a research participant?\n",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: """
• You do not waive any legal rights by agreeing to take part in this study.
• This project has been reviewed by the Research Ethics Board for compliance with federal guidelines for research involving human participants
• If you have questions regarding your rights and welfare as a research participant in this study (REB# 21-03-003), please contact: Manager, Research Ethics; University of Guelph; reb@uoguelph.ca; (519) 824-4120 (ext. 56606).

By clicking the below “I agree” button, you are confirming that you have read and understood everything above and agree to take part in this research study. Please keep in mind that your participation is voluntary, and you may withdraw at any point by closing this study in your web-browser.
Make sure to print this page in order to keep it for your own records.
"""),
                              ],
                            ),
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  DesignTheme.defaultRadiusVal),
                            ),
                            color: DesignTheme.primaryColor,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  CustomRoute(builder: (context) {
                                return onNext();
                              }));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: DesignTheme.mediumPadding),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: FittedBox(
                                  child: Text(
                                    'I Agree',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
