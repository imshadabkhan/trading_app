import 'package:get/get.dart';
import 'package:trading_app/view/authentication/view/email_verification_view.dart';
import 'package:trading_app/view/authentication/view/forgot_password_view.dart';
import 'package:trading_app/view/authentication/view/login_view.dart';
import 'package:trading_app/view/authentication/view/verification_view.dart';
import 'package:trading_app/view/starting/splash_view.dart';

import '../../view/authentication/view/reset_password_view.dart';

class AppRoutes {
  static const splash = '/';
  static const onboardingView = '/onboardingview';
  static const emailVerificationView = '/emailVerificationView';
  static const forgotPassword = '/forgotPassword';
  static const loginView = '/loginView';
  static const signupView = '/signupView';
  static const verificationView = '/verificationView';
  static const subscriptionView='/subscriptionView';
  static const payViaDebitScreen='/PayViaDebitScreen';
  static const paymentStatus='/paymentStatus';
  static const musicianProfileScreen='/musicianProfileScreen';
  static const musicianHomeScreen='/musicianHomeScreen';
  static const bottomBarNavigation='/bottomBarNavigation';
  static const filterScreen='/filterScreen';
  static const inboxView='/inboxView';
  static const chatView='/chatView';
  static const notificationView='/notificationView';
  static const menuScreen='/menuScreen';
  static const comparisonScreen='/comparisonScreen';


 static final routes = [
   // GetPage(name: splash, page:()=> SplashView()),
   // GetPage(name: onboardingView, page:()=> BoardingView()),
   GetPage(name: emailVerificationView, page:()=> EmailVerificationView()),
   GetPage(name: forgotPassword, page:()=> ForgotPasswordView()),
   GetPage(name: loginView, page:()=> LoginView()),
   GetPage(name: signupView, page:()=> ResetPasswordView()),
   GetPage(name: verificationView, page:()=> VerificationView()),
   // GetPage(name: subscriptionView, page:()=> SubscriptionView()),
   // GetPage(name: payViaDebitScreen, page:()=> PayViaDebitScreen()),
// /   GetPage(name: musicianProfileScreen, page:()=> MusicianProfileScreen()),
//    GetPage(name: musicianHomeScreen, page:()=> MusicianHomeScreen()),
//    GetPage(name: bottomBarNavigation, page:()=> BottomBarNavigation()),
//    GetPage(name: filterScreen, page:()=> FilterScreen()),
//    GetPage(name: inboxView, page:()=> InboxView()),
//    GetPage(name: chatView, page:()=> ChatView()),
//    GetPage(name: notificationView, page:()=> NotificationScreen()),
//    GetPage(name: menuScreen, page:()=> MenuScreen()),
//    GetPage(name: comparisonScreen, page:()=> ComparisonScreen()),
 ];
}

