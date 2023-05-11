part of dash_chat_2;

/// {@category Customization}
class MessageOptions {
  const MessageOptions({
    this.showCurrentUserAvatar = false,
    this.showOtherUsersAvatar = true,
    this.showOtherUsersName = true,
    this.userNameBuilder,
    this.avatarBuilder,
    this.onPressAvatar,
    this.onLongPressAvatar,
    this.onLongPressMessage,
    this.onPressMessage,
    this.onPressMention,
    Color? currentUserContainerColor,
    Color? currentUserTextColor,
    this.containerColor = const Color(0xFFF5F5F5),
    this.textColor = Colors.black,
    this.messagePadding = const EdgeInsets.all(11),
    this.maxWidth,
    this.messageDecorationBuilder,
    this.top,
    this.bottom,
    this.messageRowBuilder,
    this.messageTextBuilder,
    this.parsePatterns,
    this.textBeforeMedia = true,
    this.onTapMedia,
    this.showTime = false,
    this.timeFormat,
    this.messageTimeBuilder,
    this.messageMediaBuilder,
    this.borderRadius = 18.0,
    Color? currentUserTimeTextColor,
    this.marginDifferentAuthor = const EdgeInsets.only(top: 15),
    this.marginSameAuthor = const EdgeInsets.only(top: 2),
    this.spaceWhenAvatarIsHidden = 10.0,
    this.timeFontSize = 10.0,
    this.timePadding = const EdgeInsets.only(top: 5),
    Color? timeTextColor,
  })  : _currentUserContainerColor = currentUserContainerColor,
        _currentUserTextColor = currentUserTextColor,
        _currentUserTimeTextColor = currentUserTimeTextColor,
        _timeTextColor = timeTextColor;

  /// Format of the time if [showTime] is true
  /// Default to: DateFormat('HH:mm')
  final intl.DateFormat? timeFormat;

  /// If you want to show the time under the text of each message
  final bool showTime;

  /// If you want to show the avatar of the current user
  final bool showCurrentUserAvatar;

  /// If you want to show the avatar of the other users
  final bool showOtherUsersAvatar;

  /// If you want to show the name of the other users above the messages
  /// Usefull in group chats
  final bool showOtherUsersName;

  /// If you want to create your own userName widget when [showOtherUsersName] is true
  /// You can use DefaultUserName to only override some variables
  final Widget Function(ChatUser user)? userNameBuilder;

  /// Builder to create your own avatar
  /// You can use DefaultAvatar to only override some varibales
  final Widget Function(
          ChatUser, Function? onPressAvatar, Function? onLongPressAvatar)?
      avatarBuilder;

  /// Function to call when the user press on an avatar
  final Function(ChatUser)? onPressAvatar;

  /// Function to call when the user long press on an avatar
  final Function(ChatUser)? onLongPressAvatar;

  /// Function to call when the user long press on a message
  final Function(ChatMessage)? onLongPressMessage;

  /// Function to call when the user press on a message
  final Function(ChatMessage)? onPressMessage;

  /// Function to call when the user press on a message mention
  final Function(Mention)? onPressMention;

  /// Color of the current user chat bubbles
  ///
  /// Default to: `Theme.of(context).primaryColor`
  Color currentUserContainerColor(BuildContext context) {
    return _currentUserContainerColor ?? Theme.of(context).primaryColor;
  }

  /// Used to calculate [currentUserContainerColor]
  final Color? _currentUserContainerColor;

  /// Color of the current user text in chat bubbles
  ///
  /// Default to: `Theme.of(context).colorScheme.onPrimary`
  Color currentUserTextColor(BuildContext context) {
    return _currentUserTextColor ?? Theme.of(context).colorScheme.onPrimary;
  }

  /// Used to calculate [currentUserTextColor]
  final Color? _currentUserTextColor;

  /// Color of current user time text in chat bubbles
  ///
  /// Default to: `currentUserTextColor`
  Color currentUserTimeTextColor(BuildContext context) {
    return _currentUserTimeTextColor ?? currentUserTextColor(context);
  }

  /// Used to calculate [currentUserTimeTextColor]
  final Color? _currentUserTimeTextColor;

  /// Color of the other users chat bubbles
  ///
  /// Default to: `Colors.grey.shade100`
  final Color containerColor;

  /// Color of the other users text in chat bubbles
  ///
  /// Default to: `Colors.black`
  final Color textColor;

  /// Color of other users time text in chat bubbles
  ///
  /// Default to: `textColor`

  Color timeTextColor() {
    return _timeTextColor ?? textColor;
  }

  /// Used to calculate [timeTextColor]
  final Color? _timeTextColor;

  /// Builder to create the entire message row yourself
  final Widget Function(
    ChatMessage message,
    ChatMessage? previousMessage,
    ChatMessage? nextMessage,
    bool isAfterDateSeparator,
    bool isBeforeDateSeparator,
  )? messageRowBuilder;

  /// Builder to create own message text widget
  final Widget Function(ChatMessage message, ChatMessage? previousMessage,
      ChatMessage? nextMessage)? messageTextBuilder;

  /// Builder to create your own media container widget
  final Widget Function(ChatMessage message, ChatMessage? previousMessage,
      ChatMessage? nextMessage)? messageMediaBuilder;

  /// Builder to create your own time widget
  /// (shown under the text when [showTime] is true)
  final Widget Function(ChatMessage message, bool isOwnMessage)?
      messageTimeBuilder;

  /// List of MatchText using flutter_parsed_text library
  /// to parse and customize accordingly some part of the text
  /// By default ParsedType.URL is set and will use launchUrl to open the link
  final List<MatchText>? parsePatterns;

  /// Padding around the text in chat bubbles
  ///
  /// Default to: `EdgeInsets.all(11)`
  final EdgeInsets messagePadding;

  /// Max message width
  ///
  /// Default to: `MediaQuery.of(context).size.width * 0.7`
  final double? maxWidth;

  /// When a message have both an text and a list of media
  /// it will determine which one th show first
  final bool textBeforeMedia;

  /// To create your own BoxDecoration fot the chat bubble
  /// You can use defaultMessageDecoration to only override some variables
  final BoxDecoration Function(
      ChatMessage message,
      ChatMessage? previousMessage,
      ChatMessage? nextMessage)? messageDecorationBuilder;

  /// A widget to show above the chat bubble
  final Widget Function(ChatMessage message, ChatMessage? previousMessage,
      ChatMessage? nextMessage)? top;

  /// A widget to show under the chat bubble
  final Widget Function(ChatMessage message, ChatMessage? previousMessage,
      ChatMessage? nextMessage)? bottom;

  /// Function to call when the user clicks on a media
  /// Will not work with the default video player
  final void Function(ChatMedia media)? onTapMedia;

  /// Border radius of the chat bubbles
  ///
  /// Default to: `18.0`
  final double borderRadius;

  /// Margin around the chat bubble when previous author is different
  ///
  /// Default to: `const EdgeInsets.only(top: 15)`
  final EdgeInsets marginDifferentAuthor;

  /// Margin around the chat bubble when previous author is the same
  ///
  /// Default to: `const EdgeInsets.only(top: 2)`
  final EdgeInsets marginSameAuthor;

  /// Space between chat bubble and edge of the list when avatar is hidden via [showOtherUsersAvatar] or [showCurrentUserAvatar]
  ///
  /// Default to: `10.0`
  final double spaceWhenAvatarIsHidden;

  /// Font size of the time text in chat bubbles
  ///
  /// Default to: `10.0`
  final double timeFontSize;

  /// Space between time and message text in chat bubbles
  ///
  /// Default to: `const EdgeInsets.only(top: 5)`
  final EdgeInsets timePadding;
}
