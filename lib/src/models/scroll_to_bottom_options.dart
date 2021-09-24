part of dash_chat_2;

/// {@category Customization}
class ScrollToBottomOptions {
  const ScrollToBottomOptions({
    this.disabled = false,
    this.scrollToBottomBuilder,
    this.onScrollToBottomPress,
  });

  /// If you don't want to show the scroll-to-bottom widget
  final bool disabled;

  /// Builder to create your own scroll-to-bottom widget
  /// You can use DefaultScrollToBottom to only override some variables
  final Widget Function(ScrollController scrollController)?
      scrollToBottomBuilder;

  /// Function to call when the scroll-to-bottom widget is pressed
  /// It will scroll down in any case
  final void Function()? onScrollToBottomPress;
}
