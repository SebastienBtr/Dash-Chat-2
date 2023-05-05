part of dash_chat_2;

class MessageStyle {
  const MessageStyle({
    this.borderRadius = 18.0,
    this.currentUserContainerColor = Colors.white,
    this.currentUserTextColor = Colors.white,
    this.marginDifferentAuthor = const EdgeInsets.only(top: 15),
    this.marginSameAuthor = const EdgeInsets.only(top: 2),
    this.maxWidth,
    this.otherUserContainerColor = const Color(0xFFF5F5F5),
    this.otherUserTextColor = Colors.black,
    this.padding = const EdgeInsets.all(11),
    this.spaceWhenAvatarIsMissing = 10.0,
  });

  /// Border radius of the chat bubbles
  ///
  /// Default: `18.0`
  final double borderRadius;

  /// Color of currentUser's chat bubbles
  ///
  /// Default: `Colors.white`
  final Color currentUserContainerColor;

  /// Color of currentUser's text in chat bubbles
  ///
  /// Default: `Colors.white`
  final Color currentUserTextColor;

  /// Margin around the chat bubble when previous author is different
  ///
  /// Default: `Colors.white`
  final EdgeInsets marginDifferentAuthor;

  /// Margin around the chat bubble when previous author is the same
  ///
  /// Default: `Colors.white`
  final EdgeInsets marginSameAuthor;

  /// Max chat bubble width
  ///
  /// Default: `MediaQuery.of(context).size.width * 0.7`
  final double? maxWidth;

  /// Color of other user's chat bubbles
  ///
  /// Default: `Colors.grey.shade100`
  final Color otherUserContainerColor;

  /// Color of other user's text in chat bubbles
  ///
  /// Default: `Colors.black`
  final Color otherUserTextColor;

  /// Padding around the text in chat bubbles
  ///
  /// Default: `EdgeInsets.all(11)`
  final EdgeInsets padding;

  /// Space between chat bubble and edge of the list when avatar is missing
  ///
  /// Default: `10.0`
  final double spaceWhenAvatarIsMissing;

  /// Creates a copy of this object with the given fields replaced with the new values.
  MessageStyle copyWith({
    double? borderRadius,
    Color? currentUserContainerColor,
    Color? currentUserTextColor,
    EdgeInsets? marginDifferentAuthor,
    EdgeInsets? marginSameAuthor,
    double? maxWidth,
    Color? otherUserContainerColor,
    Color? otherUserTextColor,
    EdgeInsets? padding,
    double? spaceWhenAvatarIsMissing,
  }) {
    return MessageStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      currentUserContainerColor:
          currentUserContainerColor ?? this.currentUserContainerColor,
      currentUserTextColor: currentUserTextColor ?? this.currentUserTextColor,
      marginDifferentAuthor:
          marginDifferentAuthor ?? this.marginDifferentAuthor,
      marginSameAuthor: marginSameAuthor ?? this.marginSameAuthor,
      maxWidth: maxWidth ?? this.maxWidth,
      otherUserContainerColor:
          otherUserContainerColor ?? this.otherUserContainerColor,
      otherUserTextColor: otherUserTextColor ?? this.otherUserTextColor,
      padding: padding ?? this.padding,
      spaceWhenAvatarIsMissing:
          spaceWhenAvatarIsMissing ?? this.spaceWhenAvatarIsMissing,
    );
  }
}
