part of dash_chat;

class DefaultMessageText extends StatelessWidget {
  const DefaultMessageText({
    required this.message,
    required this.isOwnMessage,
    this.messageOptions = const MessageOptions(),
    Key? key,
  }) : super(key: key);

  /// Message tha contains the text to show
  final ChatMessage message;

  /// If the message is from the current user
  final bool isOwnMessage;

  /// Options to customize the behaviour and design of the messages
  final MessageOptions messageOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isOwnMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        ParsedText(
          parse: messageOptions.parsePatterns != null
              ? messageOptions.parsePatterns!
              : defaultPersePatterns,
          text: message.text,
          style: TextStyle(
            color: isOwnMessage
                ? (messageOptions.currentUserTextColor ?? Colors.white)
                : (messageOptions.textColor ?? Colors.black),
          ),
        ),
        if (messageOptions.showTime)
          messageOptions.messageTimeBuilder != null
              ? messageOptions.messageTimeBuilder!(message, isOwnMessage)
              : Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    (messageOptions.timeFormat ?? intl.DateFormat('HH:mm'))
                        .format(message.createdAt),
                    style: TextStyle(
                      color: isOwnMessage
                          ? (messageOptions.currentUserTextColor ??
                              Colors.white70)
                          : (messageOptions.textColor ?? Colors.black54),
                      fontSize: 10,
                    ),
                  ),
                ),
      ],
    );
  }
}
