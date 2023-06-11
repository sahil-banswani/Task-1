import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Payment Screen",
          style: GoogleFonts.pacifico(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
