import 'package:observationStudyScaffold/models/contact_details.dart';

/// [Consent] is a class that stores
/// all the details for the consent 
/// information that you will then pass
/// to the [StudyConsentPage] to be
/// displayed to participants
class Consent {
  
  /// The title for the study for potential participants to read
  /// through the consent process
  String get titleOfStudy => _titleOfStudy ?? "Study Title";
  String _titleOfStudy;

  
  /// The research motivation for potential participants to 
  /// understand what the purpose of the study is
  String get researchMotivation =>
      _researchMotivation ?? "Our Research Motivation";
  String _researchMotivation;

  
  /// The details of the study representing 
  String get studyDetails => _studyDetails ?? "The Study Details are blah";
  String _studyDetails;

 
  /// The details of privacy measures taken 
  /// and how data is collected during the
  String get privacyAndDataCollectionDetails =>
      _privacyAndDataCollectionDetails ?? "Privacy and Data Collection Details";
   String _privacyAndDataCollectionDetails;

  
  /// This stores the contact details 
  /// of the researcher which contains
  /// the name, email, institution, position,
  /// and the description for all those details
  ContactDetails get contactDetails =>
      _contactDetails ?? ContactDetails.dummy();
  ContactDetails _contactDetails;

  /// The string used at the end of the 
  /// study to have users confirm their 
  /// intentions to consent to the study
  String get approvalString =>
      _approvalString ??
      "Click to confirm that you have read all the details above and consent to the study.";
  String _approvalString;

  /// Constructor for creating the consent form
  Consent({
    String titleOfStudy,
    String researchMotivation,
    String studyDetails,
    String privacyAndDataCollectionDetails,
    ContactDetails contactDetails,
    String approvalString,
  })  : _titleOfStudy = titleOfStudy,
        _researchMotivation = researchMotivation,
        _studyDetails = studyDetails,
        _privacyAndDataCollectionDetails = privacyAndDataCollectionDetails,
        _contactDetails = contactDetails,
        _approvalString = approvalString;

  /// Consent form Constructor for testing 
  Consent.dummy()
      : _titleOfStudy = null,
        _researchMotivation = null,
        _studyDetails = null,
        _privacyAndDataCollectionDetails = null,
        _contactDetails = null,
        _approvalString = null;
}
