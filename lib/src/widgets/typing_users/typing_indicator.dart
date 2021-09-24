part of dash_chat_2;

/// @nodoc
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({
    Key? key,
    this.flashingCircleDarkColor = const Color(0xFF333333),
    this.flashingCircleBrightColor = const Color(0xFFaec1dd),
  }) : super(key: key);

  /// Dark color in the animation
  final Color flashingCircleDarkColor;

  /// Light color in the animation
  final Color flashingCircleBrightColor;

  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _repeatingController;
  final List<Interval> _dotIntervals = const <Interval>[
    Interval(0.25, 0.8),
    Interval(0.35, 0.9),
    Interval(0.45, 1.0),
  ];

  @override
  void initState() {
    super.initState();
    _repeatingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _repeatingController.repeat();
  }

  @override
  void dispose() {
    _repeatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildFlashingCircle(0),
          _buildFlashingCircle(1),
          _buildFlashingCircle(2),
        ],
      ),
    );
  }

  Widget _buildFlashingCircle(int index) {
    return AnimatedBuilder(
      animation: _repeatingController,
      builder: (BuildContext context, Widget? child) {
        final double circleFlashPercent =
            _dotIntervals[index].transform(_repeatingController.value);
        final double circleColorPercent = sin(pi * circleFlashPercent);

        return Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.lerp(widget.flashingCircleDarkColor,
                widget.flashingCircleBrightColor, circleColorPercent),
          ),
        );
      },
    );
  }
}
