import 'package:flavour_track/pages/bookDonationForm.dart';
import 'package:flavour_track/pages/clothsDonationForm.dart';
import 'package:flavour_track/pages/foodDonationForm.dart';
import 'package:flavour_track/pages/foodDonationPage.dart';
import 'package:flavour_track/pages/moneyDonationForm.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: MoneyDonationForm()),
    );
  }
}
