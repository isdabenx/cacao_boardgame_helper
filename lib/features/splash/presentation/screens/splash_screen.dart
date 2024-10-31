import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/config/routes/app_routes.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/splash/presentation/widgets/background_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _enableImmersiveMode();
    _startInitialization();
  }

  void _enableImmersiveMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    _disableImmersiveMode();
    super.dispose();
  }

  void _disableImmersiveMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  Future<void> _startInitialization() async {
    await Future.delayed(const Duration(seconds: 12));
    _navigateToHomeScreen();
  }

  void _navigateToHomeScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double imageAspectRatio =
        Assets.splashBackgroundWidth / Assets.splashBackgroundHeight;
    final double imageHeight = size.width / imageAspectRatio;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _BackgroundImage(),
          Center(
            child: CircularProgressIndicator(),
          ),
          _LoadingText(top: imageHeight, width: size.width),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: BackgroundImageWidget(),
    );
  }
}

class _LoadingText extends StatelessWidget {
  const _LoadingText({
    required this.top,
    required this.width,
  });

  final double top;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: SizedBox(
        width: width,
        child: Center(
          child: Text(
            'Loading...',
            style: AppTextStyles.loadingTextStyle,
          ),
        ),
      ),
    );
  }
}
