import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String userId;

  const MessageBubble( {Key key, this.message, this.isMe, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fireStoreInstance = FirebaseFirestore.instance.collection('users');
    return Row(
      mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            print(fireStoreInstance.doc(userId).id);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft:isMe?Radius.circular(20):Radius.circular(0),
                  bottomRight:!isMe?Radius.circular(20):Radius.circular(0)),
              color: isMe?Theme.of(context).primaryColor:Colors.white,
            ),
             width: ScreenUtil().setWidth(150),
             padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight
            (10),horizontal: ScreenUtil().setWidth(16)),
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight
              (4),horizontal: ScreenUtil().setWidth(8)),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: fireStoreInstance.doc(userId).get(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Text(
                          "@.....",
                          style:TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Book",
                              letterSpacing: .8,
                              height: 1.5,
                              color: isMe?Colors.white:Colors.black.withOpacity(.3),
                              fontSize: 10));
                    }
                    return Text(
                     isMe?"~me": "~ ${ snapshot.data['first_name']}",
                        style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: isMe?Colors.white:Colors.black.withOpacity(.3),
                            fontSize: 10));
                  }
                ),
                SizedBox(height: 2,),
                Text(
                  message,
                  style:TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: .8,
                      height: 1.5,
                      color: isMe?Colors.white:Colors.black,
                      fontSize: 14)),
              ],
            ),
          ),
        ),
      ],
    );

  }
}
