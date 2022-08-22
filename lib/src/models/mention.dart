part of dash_chat_2;

/// {@category Models}
class Mention {
  Mention({
    required this.title,
    this.customProperties,
  });

  /// Create a Mention instance from json data
  factory Mention.fromJson(Map<String, dynamic> jsonData) {
    return Mention(
      title: jsonData['title'].toString(),
      customProperties: jsonData['customProperties'] as Map<String, dynamic>,
    );
  }

  /// Title of the mention,
  /// it's what is visible in the message: @userName
  String title;

  /// A list of custom properties to save any data you might need
  /// For instance a user Id
  Map<String, dynamic>? customProperties;

  /// Convert a Mention into a json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'customProperties': customProperties,
    };
  }
}
