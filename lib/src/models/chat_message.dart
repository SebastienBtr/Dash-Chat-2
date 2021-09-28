part of dash_chat_2;

/// {@category Models}
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
  String text;

  /// Author of the message
  ChatUser user;

  /// List of medias of the message
  List<ChatMedia>? medias;

  /// A list of quick replies that users can use to reply to this message
  List<QuickReply>? quickReplies;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  Map<String, dynamic>? customProperties;

  /// Date of the message
  DateTime createdAt;

  /// List of mentionned users in the message TODO:
  List<ChatUser>? mentions;

  /// Status of the message TODO:
  MessageStatus? status;

  /// If the message is a reply of another one TODO:
  ChatMessage? replyTo;
}

class MessageStatus {
  final String _value;
  const MessageStatus._internal(this._value);

  @override
  toString() => _value;

  static MessageStatus parse(String value) {
    switch (value) {
      case 'none':
        return MessageStatus.none;
      case 'read':
        return MessageStatus.read;
      case 'received':
        return MessageStatus.received;
      case 'pending':
        return MessageStatus.pending;
      default:
        throw UnsupportedError('$value is not a valid MessageStatus');
    }
  }

  static const none = MessageStatus._internal('none');
  static const read = MessageStatus._internal('read');
  static const received = MessageStatus._internal('received');
  static const pending = MessageStatus._internal('pending');
}
