part of dash_chat_2;

/// {@category Default widgets}
Widget Function(Function send) defaultSendButton({
  required Color color,
  IconData icon = Icons.send,
  EdgeInsets? padding,
}) =>
    (Function fct) => InkWell(
          onTap: () => fct(),
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Icon(
              Icons.send,
              color: color,
            ),
          ),
        );
