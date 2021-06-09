import 'package:Quete/Utils/Widgets/messages/chatRoom.input.message.dart';
import 'package:Quete/Utils/Widgets/messages/chatRoom.messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class ChatRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3E6EC).withOpacity(.5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Greenline.Inc  ",
              style:    TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: "Futura Book",
                  letterSpacing: 1,
                  color: Colors.black,
                  fontSize: 18),

            ),
            Text(
              "Online. ",
              style:    TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: "Futura Book",
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(.6),
                  fontSize: 12),

            ),

          ],),
        actions: [
          Padding(
              padding:EdgeInsets.only(right: 20),child: Icon(Icons.attach_file_outlined,
            color: Colors
              .black.withOpacity(.6),
                size: 20,))
        ],
      ),
      body: Container(

        child: Column(
          children: [
            Container(
              height: 30,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
              child: Center(
                child: Text(
                  "Welcome to iGreen  chat group\n ",
                  style:    TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 12),

                ),
              ),
            ),
            Expanded(child: Messages()),
            Padding(
                padding: EdgeInsets.zero,
                child: NewMessageInput())

          ],
        ),
      ),
    );
  }
}
