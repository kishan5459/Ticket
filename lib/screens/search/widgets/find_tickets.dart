import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';

class FindTickets extends StatelessWidget {
  const FindTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppStyles.findTicketcolor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
          "Find Tickets",
          style: AppStyles.textStyle.copyWith(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}