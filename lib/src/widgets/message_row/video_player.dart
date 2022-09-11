part of dash_chat_2;

/// @nodoc
class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    required this.url,
    this.aspectRatio = 1,
    this.canPlay = true,
  });

  /// Link of the video
  final String url;

  /// The Aspect Ratio of the Video. Important to get the correct size of the video
  final double aspectRatio;

  /// If the video can be played
  final bool canPlay;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  vp.VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    initializePlayer(widget.url);
  }

  //Initialize Video Player
  void initializePlayer(String url) async {
    final fileInfo = await checkCacheFor(url);
    if (fileInfo == null) {
      _controller = vp.VideoPlayerController.network(widget.url)
        ..initialize().then((_) {
          cachedForUrl(widget.url);
          setState(() {});
        });
    } else {
      _controller = vp.VideoPlayerController.file(fileInfo.file)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  //: check for cache
  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

//:cached Url Data
  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((_) {
      // print('downloaded successfully done for $url');
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller != null && _controller!.value.isInitialized
        ? Stack(
            alignment: _controller!.value.isPlaying ? AlignmentDirectional.bottomStart : AlignmentDirectional.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: vp.VideoPlayer(_controller!),
              ),
              IconButton(
                iconSize: _controller!.value.isPlaying ? 24 : 60,
                onPressed: widget.canPlay
                    ? () {
                        setState(() {
                          _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
                        });
                      }
                    : null,
                icon: Icon(
                  _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  // size: 60,
                ),
              ),
            ],
          )
        : Container();
  }
}
