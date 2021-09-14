part of dash_chat;

class QuickReply {
  QuickReply({
    required this.title,
    this.value,
    this.customProperties,
  });

  /// Title of the quick reply,
  /// it's what will be visible in the quick replies list
  final String title;

  /// Actual value of the quick reply
  /// Use that if you want to have a message text different from the title
  final String? value;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  final Map<String, dynamic>? customProperties;
}
