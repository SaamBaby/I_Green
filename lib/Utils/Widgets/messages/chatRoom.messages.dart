import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'chatRoom.message.bubble.dart';

class Messages extends StatelessWidget {

  final fireStoreInstance = FirebaseFirestore.instance.collection('chats')
      .orderBy('createdAt',descending:true);
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fireStoreInstance.snapshots(),
      builder: (context, messageSnapShot){
        if(messageSnapShot.connectionState==ConnectionState.waiting){
          return  Center(child: CircularProgressIndicator(),);
        }

        final messageDocuments = messageSnapShot.data.docs;
        return ListView.builder(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
            (5),horizontal: ScreenUtil().setWidth(10)),
            itemCount: messageDocuments.length,
            itemBuilder: (context,index)=>
                MessageBubble(message: messageDocuments[index]['text'],isMe:
                (messageDocuments[index]['userId']==user.uid)?true:false,userId:messageDocuments[index]['userId'],)
          );
      },
    );
  }
}
