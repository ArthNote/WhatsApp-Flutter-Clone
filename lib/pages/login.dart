// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/components/widgets.dart';
import 'package:whatsapp/pages/otpScreen.dart';

import '../components/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "212", 
    countryCode: "MA", 
    e164Sc: 0, 
    geographic: true, 
    level: 1, 
    name: "Morocco", 
    example: "Morocco", 
    displayName: "Morocco", 
    displayNameNoCountryCode: "MA", 
    e164Key: ""
  );

  @override
  void dispose() {
    phoneController.dispose();
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
          "Enter your phone number",
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
                "WhatsApp needs to verify your number.",
                style: TextStyle(
                  color: textColor,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(
                    color: textColor
                  ),
                  cursorColor: tabColor,
                  controller: phoneController, 
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your phone number",
                    hintStyle: TextStyle(
                      color: grey
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: tabColor
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: tabColor
                      )
                    ),
                    suffixIcon: phoneController.text.length >= 9  ? Container(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.done, color: tabColor,),
                    ) : null,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(13),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                            countryListTheme: CountryListThemeData(
                              flagSize: 25,
                              bottomSheetHeight: size.height/1.7,
                              backgroundColor: backgroundColor,
                              inputDecoration: InputDecoration(
                                prefixIconColor: tabColor,
                                prefixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(
                                  color: grey
                                ),
                                hintText: "Search country",
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: tabColor
                                  )
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: tabColor
                                  )
                                ),
                              ),
                              textStyle: TextStyle(
                                color: textColor,
                              ),
                              searchTextStyle: TextStyle(
                                color: textColor
                              ),
                            )
                          );
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: size.width * 0.5,
              child: Button(
                text: "NEXT", 
                onPressed: (){
                  if(phoneController.text.length < 9){
                    showSnackBar(context, "Please enter a valid phone number");
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen()));
                  }
                }
              )
            ),
          ),
        ]
      ),
    );
  }
}