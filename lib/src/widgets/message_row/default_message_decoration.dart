part of dash_chat_2;

/// {@category Default widgets}
BoxDecoration defaultMessageDecoration({
  required Color color,
  required double borderTopLeft,
  required double borderTopRight,
  required double borderBottomLeft,
  required double borderBottomRight,
}) =>
    BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderTopLeft),
        topRight: Radius.circular(borderTopRight),
        bottomLeft: Radius.circular(borderBottomLeft),
        bottomRight: Radius.circular(borderBottomRight),
      ),
    );
