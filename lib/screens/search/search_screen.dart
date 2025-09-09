import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/screens/search/widgets/app_text_icon.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/search/widgets/find_tickets.dart';
import 'package:ticket_app/screens/search/widgets/ticket_promotion.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 20
        ),
        children: [
          SizedBox(height: 40,),
          Text(
            "What are\nyou looking for?",
            style: AppStyles.headLineStyle1.copyWith(
              fontSize: 35
            ),
          ),
          SizedBox(height: 20,),
          AppTicketTabs(
            firstTabText: "Upcoming Flights",
            secondTabText: "Hotels",
          ),
          SizedBox(height: 25,),
          AppTextIcon(
            icon: Icons.flight_takeoff_rounded,
            text: "Departure",
          ),
          SizedBox(height: 20,),
          AppTextIcon(
            icon: Icons.flight_land_rounded,
            text: "Arrival",
          ),
          SizedBox(height: 25,),
          FindTickets(),
          SizedBox(height: 40,),
          AppDoubleText(
            bigText: "Upcoming Flights",
            smallText: "View all",
            func: (){
              Navigator.pushNamed(
                context,
                AppRoutes.allTickets
              );
            },
          ),
          SizedBox(height: 20,),
          TicketPromotion()
        ],
      ),
    );
  }
}