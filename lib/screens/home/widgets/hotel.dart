import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class Hotel extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const Hotel({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(14.0),
        width: size.width * 0.6,
        height: 350,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            color: AppStyles.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/${hotel['image']}"))),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8, top: 16),
                child: Text(
                  hotel['place'],
                  style: AppStyles.headLineStyle1
                      .copyWith(color: AppStyles.kakiColor),
                )),
            SizedBox(
              height: 8,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  hotel['destination'],
                  style: AppStyles.textStyle.copyWith(color: Colors.white),
                )),
            SizedBox(
              height: 8,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "\$${hotel['price']}/night",
                  style: AppStyles.headLineStyle1
                      .copyWith(color: AppStyles.kakiColor),
                )),
          ],
        ));
  }
}
