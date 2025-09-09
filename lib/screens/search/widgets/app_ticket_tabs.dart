import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTabText;
  final String secondTabText;

  const AppTicketTabs({
    super.key,
    required this.firstTabText,
    required this.secondTabText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppStyles.ticketTabColor
      ),
      child: Row(
        children: [
          AppTab(
            tabText: firstTabText,
            isLeftCircularBorder: true,
            isColored: true,
          ),
          AppTab(
            tabText: secondTabText,
            isLeftCircularBorder: false,
          )
        ],
      ),
    );
  }
}

class AppTab extends StatelessWidget {
  final String tabText;
  final bool isLeftCircularBorder;
  final bool isColored;

  const AppTab({
    super.key,
    required this.tabText,
    required this.isLeftCircularBorder,
    this.isColored = false
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      width: size.width*.44,
      decoration: BoxDecoration(
        color: isColored!=true
          ? Colors.transparent
          : Colors.white,
        borderRadius: isLeftCircularBorder==true
          ? BorderRadius.horizontal(
            left: Radius.circular(50)
          )
          : BorderRadius.horizontal(
            right: Radius.circular(50)
          )
      ),
      child: Text(
        tabText,
        textAlign: TextAlign.center,
      ),
    );
  }
}