part of dash_chat_2;
// ignore_for_file: non_constant_identifier_names

class CustomSeparator {
  CustomSeparator({
    required this.shouldShowSeparator,
    required this.separator,
  });
  bool Function(ChatMessage currentMessage) shouldShowSeparator;
  Widget separator;
}
