
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/components/colors.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: appBarColor.withOpacity(0.5),
      contentPadding: EdgeInsets.all(10),
      shape: Border(
        bottom: BorderSide(
          color: appBarColor, 
          width: 1
        )
      ),
      title: Text(
        "Yassine Moussaid",
        style: TextStyle(
          color: textColor,
          fontSize: 17,
          fontWeight: FontWeight.w500
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.done_all,
            color: tabColor,
          ),
          SizedBox(width: 5,),
          Text(
            "Hello bro",
            style: TextStyle(
              color: textColor.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        )
      ),
      trailing: Text(
        "11:20 PM",
        style: TextStyle(
          color: textColor.withOpacity(0.7),
          fontSize: 13
        )
      ),
    );
  }
}


class Button extends StatelessWidget {
  Button({
    super.key,
    required this.text,
    required this.onPressed
  });
  String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: tabColor,
        minimumSize: Size(double.infinity, 50),
        //give it a rectangular shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
      onPressed: onPressed, 
      child: Text(
        text,
        style: TextStyle(
          color: black
        ),
      )
    );
  }
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    backgroundColor: searchBarColor,
    behavior: SnackBarBehavior.floating,
    elevation: 12,
    content: Text(
      text,
      style: TextStyle(
        color: textColor
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}