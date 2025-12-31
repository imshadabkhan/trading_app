import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';
import 'package:trading_app/view/home-screens/about.dart';
import 'package:trading_app/view/home-screens/edit_profile.dart';
import 'package:trading_app/view/home-screens/faq.dart';
import 'package:trading_app/view/home-screens/terms_condition.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final h = Get.height;
    return Drawer(
      width: 300,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// PROFILE
              Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(Assets.images5),
                  ),
                  SizedBox(height: 10),
                  Texts.textMedium("MK ALI TRADER",
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.bold,
                      size: h * 0.022),
                ],
              ),

              const SizedBox(height: 24),

              /// STATUS CARDS
              _statusTile(
                color: ColorConstants.redColor,
                icon: Icons.close,
                title: "Payment not verified",
              ),
              const SizedBox(height: 12),

              _statusTile(
                color: ColorConstants.orangeColor,
                icon: Icons.hourglass_bottom,
                title: "Pending Verification",
              ),
              const SizedBox(height: 12),

              _statusTile(
                color: ColorConstants.greenColor,
                icon: Icons.check_circle,
                title: "Payment Verified",
              ),

              const SizedBox(height: 30),

              /// MENU ITEMS
              _drawerItem(
                icon: Assets.edit,
                title: "Edit Profile",
                onTap: () => Get.to(() => EditProfile()),
              ),
              _drawerItem(
                icon: Assets.terms,
                title: "Terms & Conditions",
                onTap: () => Get.to(() => TermsAndConditions()),
              ),
              _drawerItem(
                icon: Assets.fandQ,
                title: "F&Q",
                onTap: () => Get.to(() => FAQScreen()),
              ),
              _drawerItem(
                icon: Assets.about,
                title: "About",
                onTap: () => Get.to(() => AboutApp()),
              ),
              _drawerItem(
                icon: Assets.logout,
                title: "Log out",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// STATUS TILE
  static Widget _statusTile({
    required Color color,
    required IconData icon,
    required String title,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 14, color: color),
        ],
      ),
    );
  }

  /// DRAWER ITEM
  static Widget _drawerItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final h = Get.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            color: ColorConstants.whiteColor,
            boxShadow: [
              BoxShadow(
                color: ColorConstants.blackColor.withOpacity(.2),
                blurRadius: 4,
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: ColorConstants.primaryColor,
                height: 16,
                width: 16,
              ),
              const SizedBox(width: 12),
              Texts.textMedium(title,
                  color: ColorConstants.primaryColor,
                  fontWeight: FontWeight.w500,
                  size: h * 0.014),
            ],
          ),
        ),
      ),
    );
  }
}
