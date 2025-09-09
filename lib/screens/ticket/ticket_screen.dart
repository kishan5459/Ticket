import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/app_media.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_positioned_circle.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    // var args = ModalRoute.of(context)!.settings.arguments as Map;
    // ticketIndex = args["index"];
    // super.didChangeDependencies();

    super.didChangeDependencies();

    final route = ModalRoute.of(context);
    if (route != null && route.settings.arguments != null) {
      final args = route.settings.arguments as Map<String, dynamic>;
      ticketIndex = args["index"];
    } else {
      // Optional: Handle the null case, like setting a default or showing an error
      ticketIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            children: [
              // SizedBox(height: 40,),
              // Text(
              //   "Tickets",
              //   style: AppStyles.headLineStyle1,
              // ),
              SizedBox(height: 20,),
              AppTicketTabs(
                firstTabText: "Upcoming",
                secondTabText: "Previous",
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                  isWholeScreen: false,
                  isColor: true,
                )
              ),
              SizedBox(height: 1,),
              Container(
                color: AppStyles.ticketColor,
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "Flutter DB", 
                          bottomText: "Passenger", 
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "52221 36869", 
                          bottomText: "Passport", 
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: true,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "1234500 6789000", 
                          bottomText: "Number Of E-ticket", 
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "B51281", 
                          bottomText: "Booking Code", 
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: true,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(AppMedia.visaCard, scale: 11,),
                                Text(
                                  " *** 2462",
                                  style: AppStyles.headLineStyle3,
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            TextStyleFourth(
                              text: "Payment method",
                              isColor: true,
                            )
                          ],
                        ),
                        AppColumnTextLayout(
                          topText: "\$249.99", 
                          bottomText: "Price", 
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 1,),
              //bottom of ticket detail section
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppStyles.ticketColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21)
                  )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: "https://google.com",
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //colurful ticet
              Container(
                padding: EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                  isWholeScreen: false,
                )
              ),
            ],
          ),
          TicketPositionedCircle(
            isPositionedLeft: true,
          ),
          TicketPositionedCircle(
            isPositionedLeft: false,
          ),
        ],
      ),
    );
  }
}