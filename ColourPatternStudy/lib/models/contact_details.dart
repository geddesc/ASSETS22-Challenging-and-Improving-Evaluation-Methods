///
class ContactDetails {
  /// The name of the researcher
  String get name => _name ?? "My Name";
  set name(String name) {
    if (name.isEmpty || name == null) return;
    _name = name;
  }

  String _name;

  // String _phoneNumber;

  // String get phoneNumber

  /// The email of the researcher or an
  /// email for participants to contact
  String get email => _email ?? "example@email.com";
  set email(String email) {
    if (email.isEmpty || email == null) return;
    _email = email;
  }

  String _email;

  /// The institution of the researcher
  String get institution => _institution ?? "University Name";
  set institution(String institution) {
    if (institution.isEmpty || institution == null) return;
    _institution = institution;
  }

  String _institution;

  /// The position currently held by the researcher
  String get position => _position ?? "Researcher";
  set position(String position) {
    if (position.isEmpty || position == null) return;
    _position = position;
  }

  String _position;

  /// This is the description via which the
  /// researchers contact details will be
  /// appended to
  String get contactDescription =>
      _contactDescription ??
      "If you have any questions regarding this study, please feel free to contact us using: ";
  set contactDescription(String contactDescription) {
    if (contactDescription.isEmpty || contactDescription == null) return;
    _contactDescription = contactDescription;
  }
  // TODO: Create a toString method for this class
  String _contactDescription;

  /// Class for creating the contact details
  ContactDetails({
    String name,
    String email,
    String institution,
    String position,
    String contactDescription,
  })  : _name = name,
        _email = email,
        _institution = institution,
        _position = position,
        _contactDescription = contactDescription;

  /// Dummy contact details for testing
  ContactDetails.dummy()
      : _name = "My name",
        _email = "contact@email.com",
        _institution = "University of Stuff",
        _position = "Researcher",
        _contactDescription = null;
}
