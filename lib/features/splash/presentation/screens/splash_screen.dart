import 'package:cacao_boardgame_helper/core/constants/assets.dart';
import 'package:cacao_boardgame_helper/core/routes/app_routes.dart';
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BackgroundImageWidget(),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
          Positioned(
            top: imageHeight,
            child: SizedBox(
              width: size.width,
              child: Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontFamily: 'burrito',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
