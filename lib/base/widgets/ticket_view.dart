import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class TicketView extends StatefulWidget {
  final Map<String, dynamic> ticket;
  const TicketView({super.key, required this.ticket});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.85,
      height: 189,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            // blue part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              child: Column(
                children: [
                  // show departure and destination with icons first line
                  Row(
                    children: [
                      TextStyleThird(text: widget.ticket["from"]["code"],),
                      Expanded(child: Container()),
                      const BigDot(),
                      // ticket flying icon
                      Expanded(
                          child: Stack(
                        children: [
                          const SizedBox(
                              height: 24,
                              child: AppLayoutbuilderWidget(
                                randomDivider: 6,
                              )),
                          Center(
                            child: Transform.rotate(
                                angle: 1.5,
                                child: const Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      )),
                      const BigDot(),
                      Expanded(child: Container()),
                      TextStyleThird(text: widget.ticket["to"]["code"],),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  // show departure and destination names with time
                  Row(
                    children: [
                       SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: widget.ticket["from"]["name"],),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(text: widget.ticket["flying_time"],),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: widget.ticket["to"]["name"], align: TextAlign.end,),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // circles and dots
            Container(
              height: 20,
              color: AppStyles.ticketRed,
              child: const Row(
                children: [
                  BigCircle(
                    isRight: false,
                  ),
                  Expanded(
                      child: AppLayoutbuilderWidget(
                    randomDivider: 10,
                    width: 6,
                  )),
                  BigCircle(
                    isRight: true,
                  ),
                ],
              ),
            ),
            // red part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketRed,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21))),
              child: Column(
                children: [
                  // show departure and destination with icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        topText: widget.ticket["date"], bottomText: "Date", alignment: CrossAxisAlignment.start,
                      ),
                      AppColumnTextLayout(
                        topText: widget.ticket["departure_time"], bottomText: "Departure time", alignment: CrossAxisAlignment.center,
                      ),
                      AppColumnTextLayout(
                        topText: widget.ticket["number"].toString(), bottomText: "Number", alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
