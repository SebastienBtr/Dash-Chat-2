part of dash_chat_2;

/// {@category Customization}
class CursorStyle {
  const CursorStyle({
    this.color,
    this.hide = false,
    this.width = 2.0,
  });

  /// Color of the cursor
  final Color? color;

  /// Hide or not the cursor
  final bool hide;

  /// Width of the cursor
  final double width;
}
