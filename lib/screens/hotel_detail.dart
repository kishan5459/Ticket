import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/controller/text_expansion_controller.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {

  late int hotelIndex = 0;

  @override
  void didChangeDependencies() {
    // var args = ModalRoute.of(context)!.settings.arguments as Map;
    // ticketIndex = args["index"];
    // super.didChangeDependencies();

    super.didChangeDependencies();

    final route = ModalRoute.of(context);
    if (route != null && route.settings.arguments != null) {
      final args = route.settings.arguments as Map<String, dynamic>;
      hotelIndex = args["index"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: false,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              //title: Text(hotelList[hotelIndex]["place"]),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/${hotelList[hotelIndex]['image']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4
                      ),
                      color: Colors.black.withAlpha(128),
                      child: Text(
                        hotelList[hotelIndex]["place"],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: AppStyles.primaryColor,
                              offset: Offset(2, 2)
                            )
                          ]
                        ),
                      ),
                    )
                  )
                ]
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(16),
                  // child: Text("Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laudanti"),
                  child: ExpandedTextWidget(
                    text: hotelList[hotelIndex]["detail"]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "More Images",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotelList[hotelIndex]['images'].length,
                    itemBuilder: (context, imageIndex){
                      return Container(
                        margin: EdgeInsets.all(16),
                        child: Image.asset(
                          "assets/images/${hotelList[hotelIndex]['images'][imageIndex]}"
                        ),
                      );
                    }
                  ),
                )
              ]
            )
          )
        ],
      )
    );
  }
}

class ExpandedTextWidget extends StatelessWidget {
  final String text;

  ExpandedTextWidget({
    super.key,
    required this.text
  });

  final TextExpansionController controller = Get.put(TextExpansionController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      (){
        var textWidget = Text(
          text,
          maxLines: controller.isExpanded.value ? null : 3,
          overflow: controller.isExpanded.value ? TextOverflow.visible : TextOverflow.clip,
        );
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget,
          GestureDetector(
            onTap: controller.toggleExpansion,
            child: Text(
              controller.isExpanded.value ? "Less" : "More",
              style: AppStyles.textStyle.copyWith(
                color: AppStyles.primaryColor
              ),
            ),
          )
        ],
      );
      }
    );
  }
}