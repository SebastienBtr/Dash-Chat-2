part of dash_chat_2;

/// @nodoc
class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    required this.url,
    this.aspectRatio = 1,
  });

  /// Link of the video
  final String url;

  /// The Aspect Ratio of the Video. Important to get the correct size of the video
  final double aspectRatio;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late vp.VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = vp.VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
            alignment: _controller.value.isPlaying
                ? AlignmentDirectional.bottomStart
                : AlignmentDirectional.center,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: vp.VideoPlayer(_controller),
              ),
              IconButton(
                iconSize: _controller.value.isPlaying ? 24 : 60,
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  // size: 60,
                ),
              ),
            ],
          )
        : Container();
  }
}
