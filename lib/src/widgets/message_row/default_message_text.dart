part of '../../../dash_chat_2.dart';

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
    return Column(
      crossAxisAlignment:
          isOwnMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          children: getMessage(context),
        ),
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
          Mention? mention;
          if (mentionRegex.hasMatch(part!)) {
            try {
              mention = message.mentions?.firstWhere(
                (Mention m) => m.title == part,
              );
            } catch (e) {
              // There is no mention
            }
          }
          if (mention != null) {
            res.add(getMention(context, mention));
          } else {
            res.add(getParsePattern(context, part, message.isMarkdown));
          }
        });
        if (res.isNotEmpty) {
          return res;
        }
      }
    }
    return <Widget>[getParsePattern(context, message.text, message.isMarkdown)];
  }

  Widget getParsePattern(BuildContext context, String text, bool isMarkdown) {
    return isMarkdown
        ? MarkdownBody(
            data: text,
            selectable: true,
            styleSheet: messageOptions.markdownStyleSheet,
            onTapLink: (String value, String? href, String title) {
              if (href != null) {
                openLink(href);
              } else {
                openLink(value);
              }
            },
          )
        : ParsedText(
            parse: messageOptions.parsePatterns != null
                ? messageOptions.parsePatterns!
                : defaultParsePatterns,
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
