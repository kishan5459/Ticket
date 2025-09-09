import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("All Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList.map(
                (singleTicket){
                  return GestureDetector(
                    onTap: () {
                      var index = ticketList.indexOf(singleTicket);
                      Navigator.pushNamed(
                        context, 
                        AppRoutes.ticketScreen,
                        arguments: {"index": index}
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TicketView(
                        ticket: singleTicket,
                        isWholeScreen: true,
                      ),
                    ),
                  );
                }
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}