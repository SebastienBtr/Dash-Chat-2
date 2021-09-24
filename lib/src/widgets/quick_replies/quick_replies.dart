part of dash_chat_2;

/// @nodoc
class QuickReplies extends StatelessWidget {
  const QuickReplies({
    required this.quickReplies,
    this.quickReplyOptions = const QuickReplyOptions(),
    Key? key,
  }) : super(key: key);

  /// List of quick replies to show
  final List<QuickReply> quickReplies;

  /// Options used to customize quick replies behaviour and design
  final QuickReplyOptions quickReplyOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: quickReplies.map((QuickReply r) {
                return quickReplyOptions.quickReplyBuilder != null
                    ? quickReplyOptions.quickReplyBuilder!(r)
                    : DefaultQuickReply(
                        quickReply: r,
                        quickReplyOptions: quickReplyOptions,
                      );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
