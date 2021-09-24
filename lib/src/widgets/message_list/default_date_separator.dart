part of dash_chat_2;

/// {@category Default widgets}
class DefaultDateSeparator extends StatelessWidget {
  const DefaultDateSeparator({
    required this.date,
    this.messageListOptions = const MessageListOptions(),
    this.padding = const EdgeInsets.symmetric(vertical: 20),
    this.textStyle = const TextStyle(color: Colors.grey),
    Key? key,
  }) : super(key: key);

  /// Date to show
  final DateTime date;

  /// Options to customize the behaviour and design of the overall list of message
  final MessageListOptions messageListOptions;

  /// Padding of the separator
  final EdgeInsets padding;

  /// Style of the text
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        _formatDateSeparator(date),
        style: textStyle,
      ),
    );
  }

  String _formatDateSeparator(DateTime date) {
    if (messageListOptions.dateSeparatorFormat != null) {
      return messageListOptions.dateSeparatorFormat!.format(date);
    }

    final DateTime today = DateTime.now();

    if (date.year != today.year) {
      return intl.DateFormat('dd MMM yyyy, HH:mm').format(date);
    } else if (date.month != today.month ||
        _getWeekOfYear(date) != _getWeekOfYear(today)) {
      return intl.DateFormat('dd MMM HH:mm').format(date);
    } else if (date.day != today.day) {
      return intl.DateFormat('E HH:mm').format(date);
    }
    return intl.DateFormat('HH:mm').format(date);
  }

  int _getWeekOfYear(DateTime date) {
    final int dayOfYear = int.parse(intl.DateFormat('D').format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }
}
