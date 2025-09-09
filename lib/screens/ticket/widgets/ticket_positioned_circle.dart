import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';

class TicketPositionedCircle extends StatelessWidget {
  final bool isPositionedLeft;
  const TicketPositionedCircle({
    super.key,
    required this.isPositionedLeft
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: isPositionedLeft==true ? 22 : null,
      right: isPositionedLeft==false ? 22 : null,
      top: 251,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: AppStyles.textColor
          )
        ),
        child: CircleAvatar(
          maxRadius: 4,
          backgroundColor: AppStyles.textColor,
        ),
      )
    );
  }
}