import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';

class AppLayoutbuilderWidget extends StatelessWidget {
  final int randomDivider;
  final double width;
  final double height;
  final bool? isColor;

  const AppLayoutbuilderWidget({
    super.key,
    required this.randomDivider,
    this.width = 3,
    this.height = 1,
    this.isColor
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        print("AppLayoutbuilderWidget ConstraintWidth: ${constraints.constrainWidth()}");
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            (constraints.constrainWidth()/randomDivider).floor(), 
            (index){
              return SizedBox(
                width: width,
                height: height,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isColor==null 
                      ? Colors.white
                      : Colors.grey.shade300,
                  )
                ),
              );
            }
          ),
        );
      }
    );
  }
}