import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/view/authentication/view/login_view.dart';
import '../../core/constants/assets_constants.dart';
import '../../core/constants/color_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 250 * (h / 800), // responsive height
              color: ColorConstants.primaryColor,
              child: Center(
                child: Text(
                  'Live Trading App',
                  style: TextStyle(
                    color: ColorConstants.whiteColor,
                    fontSize: 20 * (w / 400), // responsive font
                  ),
                ),
              ),
            ),
          ),
          AnimatedSplashScreen(
            duration: 4000,
            centered: true,
            splashIconSize: 400 * (w / 400), // responsive size
            splash: Image.asset(
              Assets.logo,
              width: 70 * (w / 400), // responsive width
            ),
            nextScreen: LoginView(),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
