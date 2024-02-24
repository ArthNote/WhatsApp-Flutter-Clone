// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../components/colors.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key, required this.title});
  String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: textColor
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon:  Icon(Icons.video_call)
          ),
          IconButton(
            onPressed: (){}, 
            icon:  Icon(Icons.call),
          ),
          PopupMenuButton(
            itemBuilder: (
              (context) => [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                )
              ]
            )
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Text("data")
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Row(children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 100,
                  controller: null,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send_rounded),
                      iconSize: 30,
                      splashColor: tabColor,
                    ),
                    floatingLabelStyle: TextStyle(
                        color: tabColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: tabColor, width: 1.0, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Type your message",
                  ),
                ),
              ),
            ]),
          )
        ]
      ),
    );
  }
}