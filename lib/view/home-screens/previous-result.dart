import 'package:flutter/material.dart';

class PreviousResult extends StatelessWidget {
  const PreviousResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 00),
      child: Column(
        children: [
          // ---------- HEADER ROW ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3EAF2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: Text(
                    "Previous Day Result",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF4E1A6F),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [
                    Text(
                      "View more",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.chevron_right, size: 16, color: Colors.white),
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 16),

          // ---------- TABLE ----------
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff4E1A6F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                // ===== TABLE HEADER =====
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Center(
                          child: Text("Pair",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),

                      // Vertical Divider 1
                      SizedBox(
                        height: 22,
                        child: VerticalDivider(color: Colors.white, thickness: 1),
                      ),

                      Expanded(
                        child: Center(
                          child: Text("Tp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),

                      // Vertical Divider 2
                      SizedBox(
                        height: 22,
                        child: VerticalDivider(color: Colors.white, thickness: 1),
                      ),

                      Expanded(
                        child: Center(
                          child: Text("SL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),

                      // Vertical Divider 3
                      SizedBox(
                        height: 22,
                        child: VerticalDivider(color: Colors.white, thickness: 1),
                      ),

                      Expanded(
                        child: Center(
                          child: Text("Total Wins",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),

                // --- Horizontal Divider under header ---
                const Divider(color: Colors.white, height: 1, thickness: 1),

                // ===== TABLE ROW (GOLD) =====
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      // GOLD BUTTON
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF9800),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Gold",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      // NO DIVIDER HERE (requested)

                      // Vertical Divider between TP
                      const SizedBox(
                        height: 28,

                      ),

                      // TP
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text("2",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),

                      // Vertical Divider
                      const SizedBox(
                        height: 28,

                      ),

                      // SL
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text("2",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),

                      // Vertical Divider
                      const SizedBox(
                        height: 28,

                      ),

                      // TOTAL WINS
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text("2",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
