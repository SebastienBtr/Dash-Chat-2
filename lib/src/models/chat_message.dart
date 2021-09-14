part of dash_chat;

class ChatMessage {
  ChatMessage({
    required this.user,
    required this.createdAt,
    this.text = '',
    this.medias,
    this.quickReplies,
    this.customProperties,
    this.mentions,
    this.status = MessageStatus.none,
    this.replyTo,
  });

  /// Text of the message (optional because you can also just send a media)
  final String text;

  /// Author of the message
  final ChatUser user;

  /// List of medias of the message
  final List<ChatMedia>? medias;

  /// A list of quick replies that users can use to reply to this message
  final List<QuickReply>? quickReplies;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  final Map<String, dynamic>? customProperties;

  /// Date of the message
  final DateTime createdAt;

  /// List of mentionned users in the message TODO:
  final List<ChatUser>? mentions;

  /// Status of the message TODO:
  final MessageStatus? status;

  /// If the message is a reply of another one TODO:
  final ChatMessage? replyTo;
}

enum MessageStatus { none, read, received, pending }
