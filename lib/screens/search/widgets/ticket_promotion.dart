import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/app_media.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';

class TicketPromotion extends StatelessWidget {
  const TicketPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width*.46,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 1,
                spreadRadius: 2
                //always spreadRadius > blurRadius
              )
            ]
          ),
          child: Column(
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppMedia.planeSit)
                  )
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "💯% discount\non the early booking of this flight. Don't miss",
                style: AppStyles.headLineStyle2,
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  width: size.width*.40,
                  height: 230,
                  decoration: BoxDecoration(
                    color: AppStyles.discountSurveyBg,
                    borderRadius: BorderRadius.circular(18)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discount\nfor survey",
                        style: AppStyles.headLineStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Take the survey about our services and get discount",
                        style: AppStyles.headLineStyle2.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 18,
                        color: AppStyles.circleColor
                      )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Container(
              width: size.width*.40,
              height: 180,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xFFEC6545)
              ),
              child: Column(
                children: [
                  Text(
                    "Take Love",
                    style: AppStyles.headLineStyle2.copyWith(
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                      children:[
                        TextSpan(
                          text: '😍\n',
                          style: TextStyle(
                            fontSize: 30
                          )
                        ),
                        TextSpan(
                          text: '😘\n',
                          style: TextStyle(
                            fontSize: 30
                          )
                        ),
                        TextSpan(
                          text: '😀',
                          style: TextStyle(
                            fontSize: 30
                          )
                        )
                      ] 
                    )
                  )
                ],
              ),
            )
          ],
        )
      ],
  );
  }
}