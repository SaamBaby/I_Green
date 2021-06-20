import 'package:Quete/Utils/Widgets/messages/chatRoom.input.message.dart';
import 'package:Quete/Utils/Widgets/messages/chatRoom.messages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3E6EC).withOpacity(.5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Greenline.Inc  ",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(
              "Welcome to our chat group\n ",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: "Futura Book",
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(.4),
                  fontSize: 12),
            ),
          ],
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.attach_file_outlined,
                color: Colors.black.withOpacity(.6),
                size: 20,
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages()),
            Padding(padding: EdgeInsets.zero, child: NewMessageInput())
          ],
        ),
      ),
    );
  }
}
