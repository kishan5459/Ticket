import 'package:flutter/material.dart';
import 'package:ticket_app/base/resources/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/screens/home/widgets/hotel.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("All Hotels"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10, //horizontal
            mainAxisSpacing: 16,
            childAspectRatio: 0.9
          ),
          itemCount: hotelList.length, 
          itemBuilder: (context, index){
            var singleHotel = hotelList[index];
            return HotelGridView(
              hotel: singleHotel,
              index: index
            );
          }),
      ),
    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;

  const HotelGridView({
    super.key,
    required this.hotel,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context, 
          AppRoutes.hotelDetail,
          arguments: {
            "index": index
          }
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/${hotel['image']}"
                    )
                  )
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                hotel["place"],
                style: AppStyles.headLineStyle3.copyWith(
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "${hotel['destination']} (\$${hotel['price']}/night)",
                style: AppStyles.headLineStyle4.copyWith(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}