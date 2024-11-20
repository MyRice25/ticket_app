import 'package:flutter/material.dart';
import 'package:ticket_app/base/bottom_nav_bar.dart';
import 'package:ticket_app/screens/home/all_tickets.dart';
import 'package:ticket_app/screens/home/widgets/all_hotels.dart';
import 'package:ticket_app/screens/hotel_detail.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => const BottomNavBar(),
        "/all_tickets":(context) => const AllTickets(),
        "/ticket_screen":(context) => const TicketScreen(),
        "/all_hotels":(context) => const AllHotels(),
        "/hotel_detail":(context) => const HotelDetail(),
      },
    );
  }
}

