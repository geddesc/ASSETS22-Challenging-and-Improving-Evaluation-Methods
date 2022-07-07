import 'package:flutter/material.dart';
import 'package:observationStudyScaffold/components/content_panel.dart';
import 'package:observationStudyScaffold/components/study_subtitle.dart';
import 'package:observationStudyScaffold/models/consent.dart';
import 'package:observationStudyScaffold/models/contact_details.dart';
import 'package:observationStudyScaffold/theme/design_theme.dart';
import 'package:observationStudyScaffold/widgets/consent_form.dart';

class StudyConsentPage extends StatelessWidget {
  final Function onNext;
  StudyConsentPage({@required this.onNext});

  final Consent consent = Consent(
    titleOfStudy:
        "This is an example research project title, replace your title here",
    researchMotivation: "We want to investigate blah, to see how blah affects blah",
    studyDetails: "Through this study you will first blah, and then you will finally blah",
    privacyAndDataCollectionDetails:
        "The data collected in this study will be blah",
    contactDetails: ContactDetails(
      name: "My Name Blah",
      email: "email@myEmail.com",
      institution: "University of My University",
      position: "Researcher",
    ),
    approvalString:
        "By Continuing to the Questionnaire you have read the above and agree to all the conditions",
  );

  @override
  Widget build(BuildContext context) {
    final List<ContentPanel> test = [
      ContentPanel(
        subTitle: StudySubTitle(
          title: "Title",
        ),
        paragraph: consent.titleOfStudy,
      ),
      ContentPanel(
        subTitle: StudySubTitle(
          title: "Motivation",
        ),
        paragraph: consent.researchMotivation,
      ),
      ContentPanel(
        subTitle: StudySubTitle(
          title: "Details",
        ),
        paragraph: consent.studyDetails,
      ),
      ContentPanel(
        subTitle: StudySubTitle(
          title: "Privacy and Data Collection",
        ),
        paragraph: consent.privacyAndDataCollectionDetails,
      ),
      ContentPanel(
        subTitle: StudySubTitle(
          title: "Contact Details",
        ),
        paragraph: consent.contactDetails.email,
      ),
      ContentPanel(
        subTitle: StudySubTitle(
          title: "Approval",
        ),
        paragraph: consent.approvalString,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.fitWidth,
                  child: Text(
            'Consent Form',
            style: TextStyle(
              color: Colors.black,
              fontSize: DesignTheme.headerFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ConsentForm(
        consentContent: test,
        onNext: onNext,
      ),
    );
  }
}
