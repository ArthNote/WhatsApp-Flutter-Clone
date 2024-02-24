
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:whatsapp/pages/home.dart';

import '../components/colors.dart';
import '../components/widgets.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: Text(
          "Verification",
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: textColor
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 20,),
              Text(
                "Enter the 6-digit code sent to your number",
                style: TextStyle(
                  color: textColor,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Pinput(
                  keyboardType: TextInputType.number,
                  defaultPinTheme: PinTheme(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    textStyle: TextStyle(
                      color: textColor,
                      fontSize: 16
                    ),
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: tabColor
                      )
                    )
                  ),
                  controller: otpController,
                  length: 6,
                  showCursor: true,
                ),
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: size.width * 0.5,
              child: Button(
                text: "NEXT", 
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false);
                }
              )
            ),
          ), 
        ]
      ),
    );
  }
}