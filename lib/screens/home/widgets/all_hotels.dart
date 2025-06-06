import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/app_routes.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
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
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.9),
            itemCount: hotelList.length,
            itemBuilder: (context, index) {
              var singleHotel = hotelList[index];
              return HotelGridView(hotel: singleHotel, index: index);
            },
          ),
        ),
      ),
    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;

  const HotelGridView({super.key, required this.hotel, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.hotelDetail, arguments: {
          "index" : index
        });
      },
      child: Container(
          padding: const EdgeInsets.all(10.0),
          // width: size.width * 0.6,
          height: 350,
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: Container(
                  // height: 180,
                  decoration: BoxDecoration(
                      color: AppStyles.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/${hotel['image']}"))),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    hotel['place'],
                    style: AppStyles.headLineStyle4
                        .copyWith(color: AppStyles.kakiColor),
                  )),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        hotel['destination'],
                        style: AppStyles.textStyle.copyWith(color: Colors.white),
                      )),
                  SizedBox(
                    width: 6,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        "\$${hotel['price']}/night",
                        style: AppStyles.headLineStyle4
                            .copyWith(color: AppStyles.kakiColor),
                      )),
                ],
              )
            ],
          )),
    );
  }
}
