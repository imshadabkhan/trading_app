import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/widgets/forex-crypto-tab.dart';

class CustomTopHeader extends StatelessWidget {
  final String announcementText;
  final bool isForex;
  final Widget forexUI;
  final Widget cryptoUI;
  final VoidCallback onForexTap;
  final VoidCallback onCryptoTap;

  const CustomTopHeader({
    super.key,
    required this.announcementText,
    required this.isForex,
    required this.forexUI,
    required this.cryptoUI,
    required this.onForexTap,
    required this.onCryptoTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main purple header box
          Container(
            width: double.infinity,
            height: 240,
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            decoration: const BoxDecoration(
              color: Color(0xff4E1A6F),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.white, size: 28),
                    Row(
                      children: [
                        const Icon(Icons.notifications, color: Colors.white, size: 28),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white70,
                              width: 2,
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage(
                              'assets/images/images (5).jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Announcement
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Text(
                            "Announcement",
                            style: TextStyle(
                              color: Get.theme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            announcementText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- Forex / Crypto Button Tabs ---
          Positioned(
            left: 0,
            right: 0,
            top: 217,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Forex Button
                GestureDetector(
                  onTap: onForexTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: isForex ? Colors.orange : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Forex",
                      style: TextStyle(
                        color: isForex ? Colors.white : Color(0xFF4E1A6F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // Crypto Button
                GestureDetector(
                  onTap: onCryptoTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: isForex ? Colors.white : Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Crypto",
                      style: TextStyle(
                        color: isForex ? Color(0xFF4E1A6F) : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          Positioned(
            left: 18,
            right: 18,
            top: 270,
            child: isForex ? forexUI : cryptoUI,
          ),
        ],
      ),
    );
  }
}

