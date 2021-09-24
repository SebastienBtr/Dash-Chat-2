part of dash_chat_2;

/// {@category Default widgets}
Widget Function(Function send) defaultSendButton({
  required Color color,
  IconData icon = Icons.send,
}) =>
    (Function fct) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => fct(),
            child: Icon(
              Icons.send,
              color: color,
            ),
          ),
        );
