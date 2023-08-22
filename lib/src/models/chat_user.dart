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

  /// Create a ChatUser instance from json data
  factory ChatUser.fromJson(Map<String, dynamic> jsonData) {
    return ChatUser(
      id: jsonData['id'].toString(),
      profileImage: jsonData['profileImage']?.toString(),
      firstName: jsonData['firstName']?.toString(),
      lastName: jsonData['lastName']?.toString(),
      customProperties: jsonData['customProperties'] as Map<String, dynamic>?,
    );
  }

  /// Id of the user
  String id;

  /// Profile image of the user
  String? profileImage;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  Map<String, dynamic>? customProperties;

  /// First name of the user,
  /// if you only have the name as one string
  /// you can put the entire value in the [fristName] field
  String? firstName;

  /// Last name of the user
  String? lastName;

  /// Get the full name (firstName + lastName) of the user
  String getFullName() {
    return (firstName ?? '') +
        (firstName != null && lastName != null
            ? ' ${lastName!}'
            : lastName ?? '');
  }

  /// Convert a ChatUser into a json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'profileImage': profileImage,
      'firstName': firstName,
      'lastName': lastName,
      'customProperties': customProperties,
    };
  }
}
