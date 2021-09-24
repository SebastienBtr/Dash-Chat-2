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
  late BetterPlayerController _betterPlayerController;
  late Orientation _orientationBeforeFullScreen;
  final List<DeviceOrientation> _portraitOrientation = <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];
  final List<DeviceOrientation> _landscapeOrientation = <DeviceOrientation>[
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ];

  @override
  void initState() {
    final BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.url,
    );
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        fit: BoxFit.scaleDown,
        aspectRatio: widget.aspectRatio,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          enableSkips: false,
          enableOverflowMenu: false,
          enableMute: false,
        ),
      ),
    );
    _betterPlayerController.setupDataSource(dataSource);

    _betterPlayerController.addEventsListener((BetterPlayerEvent event) {
      /// On fullscreen event check current Orientation
      if (event.betterPlayerEventType == BetterPlayerEventType.openFullscreen) {
        _orientationBeforeFullScreen = MediaQuery.of(context).orientation;
      }

      /// On fullscreen finish set DeviceOrientation based on saved Orientation
      if (event.betterPlayerEventType == BetterPlayerEventType.hideFullscreen) {
        if (_orientationBeforeFullScreen == Orientation.portrait) {
          SystemChrome.setPreferredOrientations(_portraitOrientation);
        }
        if (_orientationBeforeFullScreen == Orientation.landscape) {
          SystemChrome.setPreferredOrientations(_landscapeOrientation);
        }

        /// Once page correctly render in given Orientation, add normal
        /// orientations, so user can use both portrait and landscape.
        Future<void>.delayed(const Duration(milliseconds: 500), () {
          SystemChrome.setPreferredOrientations(
            <DeviceOrientation>[
              ..._portraitOrientation,
              ..._landscapeOrientation,
            ],
          );
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: BetterPlayer(controller: _betterPlayerController),
    );
  }
}
