// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:whatsapp/components/colors.dart';
import 'package:whatsapp/pages/chatPage.dart';

import '../components/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(
            side: BorderSide(color: tabColor, width: 2),
          ),
          backgroundColor: tabColor,
          child: Icon(
            Icons.chat,
            color: textColor,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: appBarColor,
          iconTheme: IconThemeData(
            color: textColor
          ),
          title: Text(
            "WhatsApp",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.search),
            ),
            PopupMenuButton(
              itemBuilder: ((context) => [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                )
              ])
            )
          ],
          //add a tab bar
          bottom: TabBar(
            unselectedLabelColor: textColor,
            labelColor: tabColor,
            indicatorColor: tabColor,
            dividerColor: appBarColor,
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )
            ]
          ),
        ),
        body: Expanded(
          child: TabBarView(
            children: [
              ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ChatPage(title: "Yassine",)));
                    },
                    child: ChatTile()
                  );
                }
              ),
              Text("data"),
              Text("data"),
            ]
          )
        ),
      ),
    );
  }
}
