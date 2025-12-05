import 'package:get/get.dart';
import 'package:trading_app/view/authentication/view/forgot_password_view.dart';
import 'package:trading_app/view/authentication/view/login_view.dart';
import 'package:trading_app/view/authentication/view/signup_view.dart';
import 'package:trading_app/view/authentication/view/verification_view.dart';
import 'package:trading_app/view/authentication/view/reset_password_view.dart';
import 'package:trading_app/view/home-screens/bottom-nav-controller.dart';
import 'package:trading_app/view/home-screens/package-screen.dart';
import 'package:trading_app/view/home-screens/screen-shot-screen.dart';
import 'package:trading_app/view/home-screens/tutorial-screen.dart';
import 'package:trading_app/view/starting/splash_view.dart';

class RoutesName {
  static const splash = '/';
  static const loginView = '/loginView';
  static const signupView = '/signupView';
  static const forgotPassword = '/forgotPassword';
  static const verificationView = '/verificationView';
  static const resetPasswordView = '/resetPasswordView';
  static const bottomBarNavigation = '/bottomBarNavigation';
  static const subscriptionScreen = '/subscriptionScreen';
  static const tutorialScreen = '/tutorialScreen';
  static const screenShotScreen = '/screenShotScreen';
}

class AppRoutes {
  static routes() => [
        // Starting & Authentication
        GetPage(name: RoutesName.splash, page: () => const SplashView()),
        GetPage(name: RoutesName.loginView, page: () => LoginView()),
        GetPage(name: RoutesName.signupView, page: () => SignUpView()),
        GetPage(
            name: RoutesName.forgotPassword, page: () => ForgotPasswordView()),
        GetPage(
            name: RoutesName.verificationView, page: () => VerificationView()),
        GetPage(
            name: RoutesName.resetPasswordView,
            page: () => ResetPasswordView()),

        // Core App
        GetPage(
            name: RoutesName.bottomBarNavigation,
            page: () => const MainNavController()),

        // Screens accessible via Home
        GetPage(
            name: RoutesName.subscriptionScreen, page: () => PackageScreen()),
        GetPage(name: RoutesName.tutorialScreen, page: () => TutorialScreen()),
        GetPage(
            name: RoutesName.screenShotScreen, page: () => ScreenShotScreen()),
      ];
}
