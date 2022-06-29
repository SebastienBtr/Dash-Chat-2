part of dash_chat_2;

/// {@category Default widgets}
Widget Function(Function send) defaultSendButton({
  required Color color,
  IconData icon = Icons.send,
}) =>
    (Function fct) => InkWell(
          onTap: () => fct(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.send,
              color: color,
            ),
          ),
        );
