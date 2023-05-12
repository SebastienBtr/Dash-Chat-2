part of dash_chat_2;

/// @nodoc
class MessageList extends StatefulWidget {
  const MessageList({
    required this.currentUser,
    required this.messages,
    this.readOnly = false,
    this.messageOptions = const MessageOptions(),
    this.messageListOptions = const MessageListOptions(),
    this.quickReplyOptions = const QuickReplyOptions(),
    this.scrollToBottomOptions = const ScrollToBottomOptions(),
    this.typingUsers,
    Key? key,
  }) : super(key: key);

  /// The current user of the chat
  final ChatUser currentUser;

  /// List of messages visible in the chat
  final List<ChatMessage> messages;

  /// Whether the chat is read only, used for safe area
  final bool readOnly;

  /// Options to customize the behaviour and design of the messages
  final MessageOptions messageOptions;

  /// Options to customize the behaviour and design of the overall list of message
  final MessageListOptions messageListOptions;

  /// Options to customize the behaviour and design of the quick replies
  final QuickReplyOptions quickReplyOptions;

  /// Options to customize the behaviour and design of the scroll-to-bottom button
  final ScrollToBottomOptions scrollToBottomOptions;

  /// List of users currently typing in the chat
  final List<ChatUser>? typingUsers;

  @override
  State<MessageList> createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  bool scrollToBottomIsVisible = false;
  bool isLoadingMore = false;
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController =
        widget.messageListOptions.scrollController ?? ScrollController();
    scrollController.addListener(() => _onScroll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  physics: widget.messageListOptions.scrollPhysics,
                  padding: widget.readOnly ? null : EdgeInsets.zero,
                  controller: scrollController,
                  reverse: true,
                  itemCount: widget.messages.length,
                  itemBuilder: (BuildContext context, int i) {
                    final ChatMessage? previousMessage =
                        i < widget.messages.length - 1
                            ? widget.messages[i + 1]
                            : null;
                    final ChatMessage? nextMessage =
                        i > 0 ? widget.messages[i - 1] : null;
                    final ChatMessage message = widget.messages[i];
                    final bool isAfterDateSeparator = _shouldShowDateSeparator(
                        previousMessage, message, widget.messageListOptions);
                    bool isBeforeDateSeparator = false;
                    if (nextMessage != null) {
                      isBeforeDateSeparator = _shouldShowDateSeparator(
                          message, nextMessage, widget.messageListOptions);
                    }
                    return Column(
                      children: <Widget>[
                        if (isAfterDateSeparator)
                          widget.messageListOptions.dateSeparatorBuilder != null
                              ? widget.messageListOptions
                                  .dateSeparatorBuilder!(message.createdAt)
                              : DefaultDateSeparator(
                                  date: message.createdAt,
                                  messageListOptions: widget.messageListOptions,
                                ),
                        if (widget.messageOptions.messageRowBuilder !=
                            null) ...<Widget>[
                          widget.messageOptions.messageRowBuilder!(
                            message,
                            previousMessage,
                            nextMessage,
                            isAfterDateSeparator,
                            isBeforeDateSeparator,
                          ),
                        ] else
                          MessageRow(
                            message: widget.messages[i],
                            nextMessage: nextMessage,
                            previousMessage: previousMessage,
                            currentUser: widget.currentUser,
                            isAfterDateSeparator: isAfterDateSeparator,
                            isBeforeDateSeparator: isBeforeDateSeparator,
                            messageOptions: widget.messageOptions,
                          ),
                      ],
                    );
                  },
                ),
              ),
              if (widget.typingUsers != null && widget.typingUsers!.isNotEmpty)
                ...widget.typingUsers!.map((ChatUser user) {
                  if (widget.messageListOptions.typingBuilder != null) {
                    return widget.messageListOptions.typingBuilder!(user);
                  }
                  return DefaultTypingBuilder(user: user);
                }).toList(),
              if (widget.messageListOptions.showFooterBeforeQuickReplies &&
                  widget.messageListOptions.chatFooterBuilder != null)
                widget.messageListOptions.chatFooterBuilder!,
              if (widget.messages.isNotEmpty &&
                  widget.messages.first.quickReplies != null &&
                  widget.messages.first.quickReplies!.isNotEmpty &&
                  widget.messages.first.user.id != widget.currentUser.id)
                QuickReplies(
                  quickReplies: widget.messages.first.quickReplies!,
                  quickReplyOptions: widget.quickReplyOptions,
                ),
              if (!widget.messageListOptions.showFooterBeforeQuickReplies &&
                  widget.messageListOptions.chatFooterBuilder != null)
                widget.messageListOptions.chatFooterBuilder!,
            ],
          ),
          if (isLoadingMore)
            Positioned(
              top: 8.0,
              right: 0,
              left: 0,
              child: widget.messageListOptions.loadEarlierBuilder ??
                  const Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ),
          if (!widget.scrollToBottomOptions.disabled && scrollToBottomIsVisible)
            widget.scrollToBottomOptions.scrollToBottomBuilder != null
                ? widget.scrollToBottomOptions
                    .scrollToBottomBuilder!(scrollController)
                : DefaultScrollToBottom(
                    scrollController: scrollController,
                    readOnly: widget.readOnly,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
        ],
      ),
    );
  }

  /// Check if a date separator needs to be shown
  bool _shouldShowDateSeparator(ChatMessage? previousMessage,
      ChatMessage message, MessageListOptions messageListOptions) {
    if (!messageListOptions.showDateSeparator) {
      return false;
    }
    if (previousMessage == null) {
      // Means this is the first message
      return true;
    }
    switch (messageListOptions.separatorFrequency) {
      case SeparatorFrequency.days:
        final DateTime previousDate = DateTime(
          previousMessage.createdAt.year,
          previousMessage.createdAt.month,
          previousMessage.createdAt.day,
        );
        final DateTime messageDate = DateTime(
          message.createdAt.year,
          message.createdAt.month,
          message.createdAt.day,
        );
        return previousDate.difference(messageDate).inDays.abs() > 0;
      case SeparatorFrequency.hours:
        final DateTime previousDate = DateTime(
          previousMessage.createdAt.year,
          previousMessage.createdAt.month,
          previousMessage.createdAt.day,
          previousMessage.createdAt.hour,
        );
        final DateTime messageDate = DateTime(
          message.createdAt.year,
          message.createdAt.month,
          message.createdAt.day,
          message.createdAt.hour,
        );
        return previousDate.difference(messageDate).inHours.abs() > 0;
      default:
        return false;
    }
  }

  /// Sroll listener to trigger different actions:
  /// show scroll-to-bottom btn and LoadEarlier behaviour
  Future<void> _onScroll() async {
    bool topReached =
        scrollController.offset >= scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange;
    if (topReached &&
        widget.messageListOptions.onLoadEarlier != null &&
        !isLoadingMore) {
      setState(() {
        isLoadingMore = true;
      });
      showScrollToBottom();
      await widget.messageListOptions.onLoadEarlier!();
      setState(() {
        isLoadingMore = false;
      });
    } else if (scrollController.offset > 200) {
      showScrollToBottom();
    } else {
      hideScrollToBottom();
    }
  }

  void showScrollToBottom() {
    if (!scrollToBottomIsVisible) {
      setState(() {
        scrollToBottomIsVisible = true;
      });
    }
  }

  void hideScrollToBottom() {
    if (scrollToBottomIsVisible) {
      setState(() {
        scrollToBottomIsVisible = false;
      });
    }
  }
}
