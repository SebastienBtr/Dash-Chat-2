part of dash_chat_2;

/// {@category Customization}
class InputOptions {
  const InputOptions({
    this.textController,
    this.focusNode,
    this.inputTextDirection = TextDirection.ltr,
    this.onMention,
    this.onMentionTriggers = const <String>['@'],
    this.onTextChange,
    this.inputDisabled = false,
    this.inputDecoration,
    this.textCapitalization = TextCapitalization.none,
    this.alwaysShowSend = false,
    this.sendOnEnter = false,
    this.textInputAction,
    this.maxInputLength,
    this.leading,
    this.trailing,
    this.sendButtonBuilder,
    this.inputTextStyle,
    this.inputToolbarStyle,
    this.inputMaxLines = 5,
    this.showTraillingBeforeSend = false,
    this.inputToolbarPadding = const EdgeInsets.all(8.0),
    this.inputToolbarMargin = const EdgeInsets.only(top: 8.0),
    this.cursorStyle = const CursorStyle(),
    this.autocorrect = true,
  });

  /// Function to call when a mention is triggered in the input,
  /// ie: typing ' @'
  /// You need to return a list of widget that will be shown inside the selection overlay,
  /// for instance user ListTiles
  final Future<List<Widget>> Function(String trigger, String value,
      void Function(String value) onMentionClick)? onMention;

  /// The list of string triggers for the onMention callback
  /// By default it only includes '@' character
  final List<String> onMentionTriggers;

  /// Function to call when the input text changee
  final void Function(String value)? onTextChange;

  /// Always show the send button, will be hidden when the text is empty otherwise
  final bool alwaysShowSend;

  /// Send the message when the user presses the enter key
  final bool sendOnEnter;

  /// Builder to create your own send button widget
  /// You can use defaultSendButton to only override some variables
  final Widget Function(void Function() send)? sendButtonBuilder;

  /// Text controller for the input field
  final TextEditingController? textController;

  /// Focus node of the input field
  final FocusNode? focusNode;

  /// Use to change the direction of the text
  final TextDirection inputTextDirection;

  /// To make the input disabled
  final bool inputDisabled;

  /// Input decoration to customize the design of the input
  /// You can use defaultInputDecoration to only orride some variables
  final InputDecoration? inputDecoration;

  /// Use to override the default TextCapitalization
  final TextCapitalization textCapitalization;

  /// An action the user has requested the text input control to perform
  final TextInputAction? textInputAction;

  /// If you want to limit the length of the text
  final int? maxInputLength;

  /// A list of widget to show before the input
  final List<Widget>? leading;

  /// A list of widget to show after the input
  final List<Widget>? trailing;

  /// To customize the text style of the inpu
  final TextStyle? inputTextStyle;

  /// To customize the overall container of the input
  final BoxDecoration? inputToolbarStyle;

  /// Max number of visible lines of the input, it will grow until this value and then scroll
  final int inputMaxLines;

  /// If [trailing] should be shown before or after the send button
  final bool showTraillingBeforeSend;

  /// Padding of the overall container of the input
  final EdgeInsets? inputToolbarPadding;

  /// Margin of the overall container of the input
  final EdgeInsets? inputToolbarMargin;

  /// Style of the cursor
  final CursorStyle cursorStyle;

  /// Whether to enable autocorrection. Defaults to true.
  final bool autocorrect;
}
