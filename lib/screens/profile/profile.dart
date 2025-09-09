import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/app_media.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/heading_text.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 40,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      AppMedia.logo
                    )
                  )
                ),
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(text: "Book Tickets", isColor: false,),
                  Text(
                    "New-York", 
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: 140,
                    height: 30,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppStyles.profileLocationColor,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppStyles.profileTextColor,
                            shape: BoxShape.circle
                          ),
                          child: Icon(
                            FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "Premium Status",
                          style: TextStyle(
                            color: AppStyles.profileTextColor,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              Text(
                "Edit",
                style: TextStyle(
                  color: AppStyles.primaryColor,
                  fontWeight: FontWeight.w300
                ),
              )
            ],
          ),
          SizedBox(height: 8,),
          Divider(color: Colors.grey.shade300,),
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18, 
                  vertical: 20
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                        color: AppStyles.primaryColor,
                        size: 27,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyleThird(text: "You\'v got a new award"),
                        TextStyleFourth(
                          text: "You have 95 flights in a year"
                        ) 
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: -45,
                top: -45,
                child: Container(
                  padding: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 12,
                      color: Colors.white
                    )
                  ),
                )
              )
            ],
          ),
          SizedBox(height: 25,),
          Text(
            "Accumulated miles",
            style: AppStyles.headLineStyle2,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppStyles.bgColor
            ),
            child: Column(
              children: [
                SizedBox(height: 15,),
                Text(
                  "192802",
                  style: TextStyle(
                    fontSize: 45,
                    color: AppStyles.textColor,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Miles accured",
                      style: AppStyles.headLineStyle4.copyWith(fontSize: 16),
                    ),
                    Text(
                      "16th July",
                      style: AppStyles.headLineStyle4.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 4,),
                Divider(color: Colors.grey.shade300,),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: "23 402", 
                      bottomText: "Miles", 
                      alignment: CrossAxisAlignment.start, 
                      isColor: false,
                    ),
                    AppColumnTextLayout(
                      topText: "Airlines CO", 
                      bottomText: "Received From", 
                      alignment: CrossAxisAlignment.end, 
                      isColor: false,
                    ),
                  ],
                ),
                SizedBox(height: 4,),
                Divider(color: Colors.grey.shade300,),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: "24", 
                      bottomText: "Miles", 
                      alignment: CrossAxisAlignment.start, 
                      isColor: false,
                    ),
                    AppColumnTextLayout(
                      topText: "McDoanal's", 
                      bottomText: "Received From", 
                      alignment: CrossAxisAlignment.end, 
                      isColor: false,
                    ),
                  ],
                ),
                SizedBox(height: 4,),
                Divider(color: Colors.grey.shade300,),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: "52 340", 
                      bottomText: "Miles", 
                      alignment: CrossAxisAlignment.start, 
                      isColor: false,
                    ),
                    AppColumnTextLayout(
                      topText: "DBestech", 
                      bottomText: "Received From", 
                      alignment: CrossAxisAlignment.end, 
                      isColor: false,
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: () {
                    print("profile inkwell taapped");
                  },
                  child: Text(
                    "How to get more miles",
                    style: AppStyles.textStyle.copyWith(
                      color: AppStyles.primaryColor
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}