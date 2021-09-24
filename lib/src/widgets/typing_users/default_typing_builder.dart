part of dash_chat_2;

/// {@category Default widgets}
class DefaultTypingBuilder extends StatelessWidget {
  const DefaultTypingBuilder({
    required this.user,
    this.text = 'is typing',
    Key? key,
  }) : super(key: key);

  /// User that is typing
  final ChatUser user;

  /// Text to show after user's name in the indicator
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(right: 2),
            child: TypingIndicator(),
          ),
          Text(
            user.getFullName(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' $text',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
