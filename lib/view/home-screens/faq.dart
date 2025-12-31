import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      'question': 'How do I place a trade?',
      'answer':
          'Go to the Markets section, select an asset, enter the amount, and tap Buy or Sell.'
    },
    {
      'question': 'How can I track my open positions?',
      'answer':
          'Go to Portfolio > Open Positions to monitor your active trades in real-time.'
    },
    {
      'question': 'How do I set stop-loss or take-profit?',
      'answer':
          'When placing a trade, enable Stop-Loss/Take-Profit and set your desired price levels.'
    },
    {
      'question': 'How do I deposit or withdraw funds?',
      'answer':
          'Go to Wallet > Deposit/Withdraw and follow the step-by-step instructions.'
    },
    {
      'question': 'How can I enable notifications for price alerts?',
      'answer':
          'Go to Settings > Alerts and toggle notifications for specific assets or price levels.'
    },
    {
      'question': 'Is my trading account secure?',
      'answer':
          'We use 2FA and bank-level encryption to ensure your account and funds are safe.'
    },
    {
      'question': 'How do I view my trade history?',
      'answer':
          'Go to Portfolio > Trade History to see past trades, profits, and losses.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    return Scaffold(
      appBar: AppBar(
        title: Texts.textBold(
          "FAQ",
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.bold,
          size: w * 0.05,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView.builder(
          itemCount: faqData.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Texts.textMedium(
                faqData[index]['question']!,
                color: ColorConstants.primaryColor,
                fontWeight: FontWeight.w600,
                size: w * 0.030,
              ),
              children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Texts.textMedium(
                      faqData[index]['answer']!,
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w600,
                      size: w * 0.030,
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
