// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:whatsapp/components/colors.dart';
import 'package:whatsapp/pages/login.dart';

import '../components/widgets.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50
            ),
            Text(
              "Welcome to WhatsApp",
              style: TextStyle(
                color: textColor,
                fontSize: 30,
                fontWeight: FontWeight.w600
              )
            ),
            SizedBox(
              height: size.height/12,
            ),
            Image.asset(
              "assets/bg.png",
              color: tabColor,
              height: 340,
              width: 340,
            ),
            SizedBox(
              height: size.height/12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Text(
                "Read our Privacy Policy. Tap \"Agree and continue\" to accept the",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: grey,
                  fontSize: 15
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: size.width * 0.75,
              child: Button(
                text:"Agree and Continue", 
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                }
              ),
            )
          ]
        )
      ),
    );
  }
}
