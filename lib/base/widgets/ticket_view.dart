import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool isWholeScreen;
  final bool? isColor;

  const TicketView({
    super.key,
    required this.ticket,
    required this.isWholeScreen,
    this.isColor
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width*0.85,
      height: 180,
      child: Container(
        margin: isWholeScreen!=true 
          ? EdgeInsets.only(right: 16)
          : EdgeInsets.only(right: 0),
        child: Column(
          children: [
            //blue part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor==null 
                  ? AppStyles.ticketBlue 
                  : AppStyles.ticketColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21)
                )
              ),
              child: Center(
                child: Column(
                  children: [
                    //show departure and destination with icons first line
                    Row(
                      children: [
                        TextStyleThird(
                          text: ticket["from"]["code"],
                          isColor: isColor,
                        ),
                        Expanded(child: Container()),
                        BigDot(isColor: isColor,),
                        Expanded(child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: AppLayoutbuilderWidget(
                                randomDivider: 6,
                                isColor: isColor,
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.57, // math.pi/2 = 1.57
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor==null 
                                  ? Colors.white 
                                  : AppStyles.planeSecondColor,
                                  
                                ),
                              ),
                            )
                          ],
                        )),
                        BigDot(isColor: isColor,),
                        Expanded(child: Container()),
                        TextStyleThird(
                          text: ticket["to"]["code"],
                          isColor: isColor,
                        )
                      ],
                    ),
                    SizedBox(height: 3,),
                    //show departure and destination names with times 
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                            text: ticket["from"]['name'],
                            isColor: isColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        TextStyleFourth(
                          text: ticket["flying_time"],
                          align: TextAlign.center,
                          isColor: isColor,
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                            text: ticket["to"]['name'],
                            align: TextAlign.end,
                            isColor: isColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //circles
            Container(
              color: isColor==null
                ? AppStyles.ticketOrange
                : AppStyles.ticketColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigCircle(
                    isRight: false,
                    isColor: isColor,
                  ),
                  Expanded(
                    child: AppLayoutbuilderWidget(
                      randomDivider: 16,
                      width: 6,
                      isColor: isColor,
                    )
                  ),
                  BigCircle(
                    isRight: true,
                    isColor: isColor,
                  )
                ],
              ),
            ),
            //orange part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor==null 
                  ? AppStyles.ticketOrange 
                  : AppStyles.ticketColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    isColor==null ? 21 : 0
                  ),
                  bottomRight: Radius.circular(
                    isColor==null ? 21 : 0
                  )
                )
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //show departure and destination with icons first line
                    AppColumnTextLayout(
                      topText: ticket["date"], 
                      bottomText: "Date", 
                      alignment: CrossAxisAlignment.start,
                      isColor: isColor,
                    ),
                    AppColumnTextLayout(
                      topText: ticket["departure_time"], 
                      bottomText: "Departure Time", 
                      alignment: CrossAxisAlignment.center,
                      isColor: isColor,
                    ),
                    AppColumnTextLayout(
                      topText: ticket["number"].toString(), 
                      bottomText: "Number", 
                      alignment: CrossAxisAlignment.end,
                      isColor: isColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}