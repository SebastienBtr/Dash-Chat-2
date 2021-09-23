part of dash_chat;

// TODO: manage onMention

/// @nodoc
class InputToolbar extends StatefulWidget {
  const InputToolbar({
    required this.currentUser,
    required this.onSend,
    this.inputOptions = const InputOptions(),
    Key? key,
  }) : super(key: key);

  /// Options to custom the toolbar
  final InputOptions inputOptions;

  /// Function to call when the message is sent (click on the send button)
  final Function(ChatMessage) onSend;

  /// Current user using the chat
  final ChatUser currentUser;

  @override
  _InputToolbarState createState() => _InputToolbarState();
}

class _InputToolbarState extends State<InputToolbar> {
  late TextEditingController textController;

  @override
  void initState() {
    textController =
        widget.inputOptions.textController ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: widget.inputOptions.inputToolbarPadding,
        margin: widget.inputOptions.inputToolbarMargin,
        decoration: widget.inputOptions.inputToolbarStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (widget.inputOptions.leading != null)
              ...widget.inputOptions.leading!,
            Expanded(
              child: Directionality(
                textDirection: widget.inputOptions.inputTextDirection,
                child: TextField(
                  focusNode: widget.inputOptions.focusNode,
                  controller: textController,
                  enabled: !widget.inputOptions.inputDisabled,
                  textCapitalization: widget.inputOptions.textCapitalization,
                  textInputAction: widget.inputOptions.textInputAction,
                  decoration: widget.inputOptions.inputDecoration ??
                      defaultInputDecoration(),
                  maxLength: widget.inputOptions.maxInputLength,
                  minLines: 1,
                  maxLines: widget.inputOptions.inputMaxLines,
                  cursorColor: widget.inputOptions.cursorStyle.color,
                  cursorWidth: widget.inputOptions.cursorStyle.width,
                  showCursor: !widget.inputOptions.cursorStyle.hide,
                  style: widget.inputOptions.inputTextStyle,
                  onSubmitted: (String value) {
                    if (widget.inputOptions.sendOnEnter) {
                      _sendMessage();
                    }
                  },
                  onChanged: (String value) {
                    setState(() {});
                    if (widget.inputOptions.onTextChange != null) {
                      widget.inputOptions.onTextChange!(value);
                    }
                  },
                ),
              ),
            ),
            if (widget.inputOptions.trailing != null &&
                widget.inputOptions.showTraillingBeforeSend)
              ...widget.inputOptions.trailing!,
            if (widget.inputOptions.alwaysShowSend ||
                textController.text.isNotEmpty)
              widget.inputOptions.sendButtonBuilder != null
                  ? widget.inputOptions.sendButtonBuilder!(_sendMessage)
                  : defaultSendButton(color: Theme.of(context).primaryColor)(
                      _sendMessage,
                    ),
            if (widget.inputOptions.trailing != null &&
                !widget.inputOptions.showTraillingBeforeSend)
              ...widget.inputOptions.trailing!,
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (textController.text.isNotEmpty) {
      final ChatMessage message = ChatMessage(
        text: textController.text,
        user: widget.currentUser,
        createdAt: DateTime.now(),
      );
      widget.onSend(message);
      textController.text = '';
      if (widget.inputOptions.onTextChange != null) {
        widget.inputOptions.onTextChange!('');
      }
    }
  }
}
