import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/assets_constants.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/chat-header.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final double radius = w * 0.05; // auto border radius
    final double textSmall = w * 0.026;
    final double textNormal = w * 0.035;
    final double textLarge = w * 0.045;

    return Scaffold(
      body: Column(
        children: [
          const ChatHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Widgets.buildMessageBubble(
                    content: Text(
                      'we will bring Offer',
                      style: TextStyle(
                        fontSize: textNormal,
                        color: ColorConstants.blackColor.withOpacity(.7),
                      ),
                    ),
                    datecontent: Text(
                      '11/25/2025',
                      style: TextStyle(
                        fontSize: textSmall,
                        color: ColorConstants.blackColor.withOpacity(.7),
                      ),
                    ),
                    likes: 1,
                    views: 90,
                    time: '10:56 AM',
                  ),
                  Widgets.buildMessageBubble(
                    content: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(radius),
                      ),
                      child: Image.asset(
                        Assets.chatScreen,
                        height: h * 0.25,
                        width: w * 0.6,
                        fit: BoxFit.cover,
                      ),
                    ),
                    datecontent: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '11/25/2025',
                        style: TextStyle(
                          fontSize: textSmall,
                          color: ColorConstants.blackColor.withOpacity(.7),
                        ),
                      ),
                    ),
                    likes: 1,
                    views: 90,
                    time: '10:56 AM',
                  ),
                  Widgets.heightSpaceH05,
                  Widgets.buildMessageBubble(
                    content: Text(
                      'MK Ali Trader',
                      style: TextStyle(
                        fontSize: textLarge,
                        color: ColorConstants.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    datecontent: Text(
                      'Vip Trade',
                      style: TextStyle(
                        fontSize: textSmall,
                        color: ColorConstants.secandoryColor,
                      ),
                    ),
                    likes: 14,
                    views: 90,
                    time: '10:56 AM',
                  ),
                  Widgets.heightSpaceH05,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
