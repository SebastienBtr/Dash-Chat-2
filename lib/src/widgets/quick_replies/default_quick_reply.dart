part of dash_chat_2;

/// {@category Default widgets}
class DefaultQuickReply extends StatelessWidget {
  const DefaultQuickReply({
    required this.quickReply,
    this.quickReplyOptions = const QuickReplyOptions(),
    Key? key,
  }) : super(key: key);

  /// Options used to customize quick replies behaviour and design
  final QuickReplyOptions quickReplyOptions;

  /// Quick reply to show
  final QuickReply quickReply;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: quickReplyOptions.onTapQuickReply != null
          ? () => quickReplyOptions.onTapQuickReply!(quickReply)
          : null,
      child: Container(
        margin: quickReplyOptions.quickReplyMargin ??
            const EdgeInsets.symmetric(horizontal: 5),
        padding: quickReplyOptions.quickReplyPadding ??
            const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: quickReplyOptions.quickReplyStyle ??
            BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
        child: Text(
          quickReply.title,
          style: quickReplyOptions.quickReplyTextStyle ??
              TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
