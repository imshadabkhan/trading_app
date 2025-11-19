// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:music_app/controller/onboarding_controller.dart';
//
// import 'package:music_app/core/constants/color_constants.dart';
// import 'package:music_app/core/widgets/onbarding_page.dart';
// import 'package:music_app/core/widgets/widgets.dart';
// import 'package:music_app/view/authentication/view/login_view.dart';
//
// class BoardingView extends StatelessWidget {
//   OnboardingController onboardingController = Get.put(OnboardingController());
//   final PageController controller = PageController();
//
//   BoardingView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         PageView.builder(
//             itemCount: onboardingController.sliderData.length,
//             controller: controller,
//             onPageChanged: onboardingController.onPageChanged,
//             itemBuilder: (context, index) {
//               return OnBoardingPage(onboardingController.sliderData[index]);
//             }),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 50.0, left: 20, right: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               for (int i = 1; i <= 3; i++)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   child: Obx(
//                     () => onboardingController.properCircleIndexWidget(i),
//                   ),
//                 ),
//               Expanded(child: Widgets.widthSpaceW1),
//               GestureDetector(
//                   onTap: () {
//                     if (onboardingController.currentPage.value == 3) {
//                       Get.to(LoginView());
//                       // Navigate to authentication screen
//                      /// Replace '/auth' with your actual route
//                     } else {
//                       controller.nextPage(
//                         duration: Duration(milliseconds: 500),
//                         curve: Curves.linear,
//                       );
//                     }
//
//                   },
//                   child: Container(
//                     width: 60.w,
//                     height: 60.h,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstants.primaryColor),
//                     child: Icon(
//                       Icons.arrow_forward,
//                       color: Colors.white,
//                     ),
//                   )),
//             ],
//           ),
//         ),
//         // Obx(
//         //   () => onboardingController.currentPage.value < 3
//         //       ? Padding(
//         //           padding: PaddingConstants.screenPaddingHalf,
//         //           child: Row(
//         //             mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //             children: [
//         //               Expanded(
//         //                 child: CustomButton(
//         //                   label: "Skip",
//         //                   borderColor: ColorConstants.blackColor,
//         //                   radius: 50,
//         //                   onTap: () {
//         //                     // Get.toNamed(AppRoutes.userLogin);
//         //                   },
//         //                 ),
//         //               ),
//         //               Widgets.widthSpaceW3,
//         //               Widgets.widthSpaceW1,
//         //               Expanded(
//         //                 child: CustomButton(
//         //                   label: "Next",
//         //                   borderColor: Colors.transparent,
//         //                   backgroundColor: ColorConstants.primaryColor,
//         //                   textColor: ColorConstants.blackColor,
//         //                   radius: 50,
//         //                   onTap: () {
//         //                     controller.nextPage(
//         //                         duration: Duration(milliseconds: 500),
//         //                         // curve: Curves.decelerate
//         //                         curve: Curves.linear);
//         //                   },
//         //                 ),
//         //               ),
//         //             ],
//         //           ),
//         //         )
//         //       : Padding(
//         //           padding: PaddingConstants.screenPaddingHalf,
//         //           child: CustomButton(
//         //             label: "Continue",
//         //             textColor: ColorConstants.blackColor,
//         //             backgroundColor: ColorConstants.primaryColor,
//         //             radius: 50,
//         //             onTap: () {
//         //               // Get.toNamed(AppRoutes.userLogin);
//         //             },
//         //           ),
//         //         ),
//         // )
//       ],
//     ));
//   }
// }
