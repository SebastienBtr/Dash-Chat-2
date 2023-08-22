part of dash_chat_2;

/// {@category Models}
class QuickReply {
  QuickReply({
    required this.title,
    this.value,
    this.customProperties,
  });

  /// Create a QuickReply instance from json data
  factory QuickReply.fromJson(Map<String, dynamic> jsonData) {
    return QuickReply(
      title: jsonData['title'].toString(),
      value: jsonData['value']?.toString(),
      customProperties: jsonData['customProperties'] as Map<String, dynamic>?,
    );
  }

  /// Title of the quick reply,
  /// it's what will be visible in the quick replies list
  String title;

  /// Actual value of the quick reply
  /// Use that if you want to have a message text different from the title
  String? value;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  Map<String, dynamic>? customProperties;

  /// Convert a QuickReply into a json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'value': value,
      'customProperties': customProperties,
    };
  }
}
