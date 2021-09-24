part of dash_chat_2;

/// {@category Default widgets}
class DefaultScrollToBottom extends StatelessWidget {
  const DefaultScrollToBottom({
    required this.scrollController,
    this.backgroundColor,
    this.textColor,
    this.bottom = 10.0,
    this.left = 0.0,
    this.right = 0.0,
    this.top,
    this.height = 30.0,
    this.width = 30.0,
    this.elevation = 5,
    this.icon = Icons.arrow_downward,
    this.iconSize = 18,
    this.onScrollToBottomPress,
    Key? key,
  }) : super(key: key);

  /// Scroll controller of the chat list
  final ScrollController scrollController;

  /// Background color of the button
  final Color? backgroundColor;

  /// Icon color of the button
  final Color? textColor;

  /// The distance that the child's bottom edge is inset from the bottom of the stack
  final double? bottom;

  /// The distance that the child's left edge is inset from the left of the stack
  final double? left;

  /// The distance that the child's right edge is inset from the right of the stack
  final double? right;

  /// The distance that the child's top edge is inset from the top of the stack
  final double? top;

  /// Height of the button
  final double height;

  /// Width of the button
  final double width;

  /// Elevation of the button
  final double elevation;

  /// Icon of the button
  final IconData icon;

  /// Icon size
  final double iconSize;

  /// Function to call when the scroll-to-bottom widget is pressed
  /// It will scroll down in any case
  final void Function()? onScrollToBottomPress;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      left: left,
      top: top,
      bottom: bottom,
      child: SizedBox(
        width: width,
        height: height,
        child: RawMaterialButton(
          elevation: elevation,
          fillColor: backgroundColor,
          shape: const CircleBorder(),
          child: Icon(
            icon,
            size: iconSize,
            color: textColor,
          ),
          onPressed: () {
            if (onScrollToBottomPress != null) {
              onScrollToBottomPress!();
            }
            scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}
