part of dash_chat_2;

/// {@category Customization}
class QuickReplyOptions {
  const QuickReplyOptions({
    this.onTapQuickReply,
    this.quickReplyPadding,
    this.quickReplyMargin,
    this.quickReplyStyle,
    this.quickReplyTextStyle,
    this.quickReplyBuilder,
  });

  /// Function to call when the user click on a quick reply
  /// Use that to create a message and send it
  final Function(QuickReply)? onTapQuickReply;

  /// Padding of a quick reply container
  final EdgeInsets? quickReplyPadding;

  /// Margin of a quick reply container
  final EdgeInsets? quickReplyMargin;

  /// BoxDecoration of a quick reply container
  final BoxDecoration? quickReplyStyle;

  /// TextStyle of a quick reply
  final TextStyle? quickReplyTextStyle;

  /// Builder to create your own quickReply builder
  final Widget Function(QuickReply)? quickReplyBuilder;
}
