part of dash_chat_2;

/// {@category Models}
class ChatUser {
  ChatUser({
    required this.id,
    this.profileImage,
    this.customProperties,
    this.firstName,
    this.lastName,
  });

  /// Id of the user
  final String id;

  /// Profile image of the user
  final String? profileImage;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  final Map<String, dynamic>? customProperties;

  /// First name of the user, 
  /// if you only have the name as one string 
  /// you can put the entire value in the [fristName] field
  final String? firstName;

  /// Last name of the user
  final String? lastName;

  /// Get the full name (firstName + lastName) of the user
  String getFullName() {
    return (firstName ?? '') +
        (firstName != null && lastName != null
            ? ' ' + lastName!
            : lastName ?? '');
  }
}
