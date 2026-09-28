import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../auth/login_screen.dart';

const String kSplashVideo =
    'assets/videos/SplashScreen_animation_for_LOYLA.mp4';
const double kSplashPlaybackSpeed = 2.0;
const Duration kLastFrameHold = Duration(seconds: 1);
const Duration kMinBranding = Duration(seconds: 2);
const Duration kBrandingCeiling = Duration(seconds: 12);
const Color kSplashBackground = Color.fromARGB(255, 225, 224, 224);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Completer<void> _played = Completer<void>();
  VideoPlayerController? _controller;
  Timer? _holdTimer;
  Timer? _ceilingTimer;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
    _waitThenNavigate();
  }

  void _finish() {
    if (!_played.isCompleted) _played.complete();
  }

  Future<void> _initVideo() async {
    // Backstop: a stuck video must never strand the user on the splash.
    _ceilingTimer = Timer(kBrandingCeiling, _finish);

    // Silent, and mixWithOthers so it doesn't pause the user's music.
    final player = VideoPlayerController.asset(
      kSplashVideo,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _controller = player;

    try {
      await player.initialize();
      if (_disposed || !mounted) return;
      await player.setVolume(0);
      await player.setPlaybackSpeed(kSplashPlaybackSpeed);
      player.addListener(_onTick);
      setState(() {});
      await player.play();
    } catch (e) {
      debugPrint('Splash video could not play: $e');
      _finish();
    }
  }

  void _onTick() {
    final player = _controller;
    if (player == null || _holdTimer != null) return;

    final value = player.value;
    if (!value.isInitialized) return;
    // Android often stops a few ms before the reported duration.
    if (!value.isCompleted && value.position < value.duration) return;

    player.removeListener(_onTick);
    unawaited(player.pause());
    _holdTimer = Timer(kLastFrameHold, _finish);
  }

  Future<void> _waitThenNavigate() async {
    await Future.wait([_played.future, Future<void>.delayed(kMinBranding)]);
    if (!mounted) return;

    // TODO: check for a saved session here once real auth exists.
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _disposed = true;
    _ceilingTimer?.cancel();
    _holdTimer?.cancel();
    _controller?.removeListener(_onTick);
    _controller?.dispose();
    _finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackground,
      body: Center(
        child: Semantics(
          label: 'Loyla',
          child: _SplashVideoFrame(controller: _controller),
        ),
      ),
    );
  }
}

/// The film in a 4:3 window that crops the 16:9 source instead of letterboxing.
class _SplashVideoFrame extends StatelessWidget {
  const _SplashVideoFrame({required this.controller});

  static const double frameAspect = 4 / 3;

  final VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    final source = controller;

    // Nothing until there is a first frame, so no black rectangle flashes.
    if (source == null || !source.value.isInitialized) {
      return const AspectRatio(
        aspectRatio: frameAspect,
        child: ColoredBox(color: kSplashBackground),
      );
    }

    return AspectRatio(
      aspectRatio: frameAspect,
      child: ColoredBox(
        color: kSplashBackground,
        child: ClipRect(
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: source.value.size.width,
              height: source.value.size.height,
              child: VideoPlayer(source),
            ),
          ),
        ),
      ),
    );
  }
}
