import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class NewMessageInput extends StatefulWidget {
  @override
  _NewMessageInputState createState() => _NewMessageInputState();
}

class _NewMessageInputState extends State<NewMessageInput> {
  TextEditingController _controller = TextEditingController();

  var fireStoreInstance = FirebaseFirestore.instance.collection('chats');
  String enteredMessage ='';
   void sendMessage(){
     FocusScope.of(context).unfocus();
     fireStoreInstance.add({
       'text':enteredMessage,
       'createdAt':Timestamp.now(),
       'userId':UserCacheService.user.id
     });
     _controller.clear();
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child:  TextField(
              controller: _controller,
              onChanged: (value){
                setState(() {
                  enteredMessage= value;
                });
              },
              style:   TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: "Futura Book",
                  letterSpacing: .8,
                  height: 1.5,
                  color: Colors.black.withOpacity(.8),
                  fontSize: 14),
              decoration: InputDecoration(
                errorStyle: TextStyle(
                    fontFamily: 'Futura Book',
                    color:  Colors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
                hintText: "Enter your message",
                hintStyle:   TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: "Futura Book",
                    letterSpacing: .8,
                    height: 1.5,
                    color: Colors.black.withOpacity(.4),
                    fontSize: 14),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: enteredMessage.trim().isEmpty? null:sendMessage,
                    icon: Icon(Icons.send,

                  )
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
