import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/routes/app_routes.dart';
import 'package:trading_app/view/authentication/controller/authentication_controller.dart';

void main() {
  Get.put(AuthenticationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RoutesName.splash,
      getPages: AppRoutes.routes(),
    );
  }
}
