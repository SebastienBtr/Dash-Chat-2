part of dash_chat_2;

/// {@category Default widgets}
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
    return Stack(
      children: <Widget>[
        Wrap(
          verticalDirection: VerticalDirection.down,
          alignment: WrapAlignment.end,
          children: <Widget>[
            ...getMessage(context),
            // for reserved text
            if (isOwnMessage) const Text('                 \u202F')
            // here the icon for read receipt is generally not shown so we need lesser space
            else const Text('            \u202F'),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (messageOptions.showTime)
                  messageOptions.messageTimeBuilder != null
                      ? messageOptions.messageTimeBuilder!(message, isOwnMessage)
                      : Padding(
                    padding: messageOptions.timePadding,
                    child: Text(
                      (messageOptions.timeFormat ?? intl.DateFormat('HH:mm'))
                          .format(message.createdAt),
                      style: TextStyle(
                        color: isOwnMessage
                            ? messageOptions.currentUserTimeTextColor(context)
                            : messageOptions.timeTextColor(),
                        fontSize: messageOptions.timeFontSize,
                      ),
                    ),
                  ),
                Visibility(
                  visible: isOwnMessage,
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                      child: messageOptions.showStatus ?
                      message.status == MessageStatus.read ? Icon(
                        Icons.done_all, color: messageOptions.currentUserReadStatusIconColor(context), size: 15,
                      ) :
                      message.status == MessageStatus.received ? Icon(
                          Icons.check, color: messageOptions.currentUserReadStatusIconColor(context), size: 15
                      ) :
                      Container() : Container()
                  ),
                )
              ]
          ),
        ),
      ],
    );
  }

  List<Widget> getMessage(BuildContext context) {
    if (message.mentions != null && message.mentions!.isNotEmpty) {
      String stringRegex = r'([\s\S]*)';
      String stringMentionRegex = '';
      for (final Mention mention in message.mentions!) {
        stringRegex += '(${mention.title})' r'([\s\S]*)';
        stringMentionRegex += stringMentionRegex.isEmpty
            ? '(${mention.title})'
            : '|(${mention.title})';
      }
      final RegExp mentionRegex = RegExp(stringMentionRegex);
      final RegExp regexp = RegExp(stringRegex);

      RegExpMatch? match = regexp.firstMatch(message.text);
      if (match != null) {
        List<Widget> res = <Widget>[];
        match
            .groups(List<int>.generate(match.groupCount, (int i) => i + 1))
            .forEach((String? part) {
          if (mentionRegex.hasMatch(part!)) {
            Mention mention = message.mentions!.firstWhere(
                  (Mention m) => m.title == part,
            );
            res.add(getMention(context, mention));
          } else {
            res.add(getParsePattern(context, part));
          }
        });
        if (res.isNotEmpty) {
          return res;
        }
      }
    }
    return <Widget>[getParsePattern(context, message.text)];
  }

  Widget getParsePattern(BuildContext context, String text) {
    return ParsedText(
      parse: messageOptions.parsePatterns != null
          ? messageOptions.parsePatterns!
          : defaultPersePatterns,
      text: text,
      style: TextStyle(
        color: isOwnMessage
            ? messageOptions.currentUserTextColor(context)
            : messageOptions.textColor,
      ),
    );
  }

  Widget getMention(BuildContext context, Mention mention) {
    return RichText(
      text: TextSpan(
        text: mention.title,
        recognizer: TapGestureRecognizer()
          ..onTap = () => messageOptions.onPressMention != null
              ? messageOptions.onPressMention!(mention)
              : null,
        style: TextStyle(
          color: isOwnMessage
              ? messageOptions.currentUserTextColor(context)
              : messageOptions.textColor,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
