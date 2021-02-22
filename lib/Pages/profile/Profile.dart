import 'package:Quete/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider =Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,toolbarHeight: 20,),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:0,horizontal: 25),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.clear,size: 18,),
                SizedBox(width: 10,),
                Text("My Account",
                  style: TextStyle(
                      fontFamily: 'Futura Heavy',
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
                Spacer(),
                Text("FAQS ?",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),)
            ],),
            SizedBox(height: 20,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Personal Information",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),),

              ],),
            SizedBox(height: 10,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Availabilities",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),),

              ],),

            SizedBox(height: 10,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Documents",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),),

              ],),
            SizedBox(height: 10,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Activities",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),),

              ],),
            SizedBox(height: 10,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Settings",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),),

              ],),
            SizedBox(height: 10,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    userProvider.signOut();
//                    userProvider.onStateChanged();
                  },
                  child: Text("Logout",
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),),
                ),

              ],),
            SizedBox(height: 10,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("About Us",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),),

              ],),
            SizedBox(height: 10,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Provacy Policy",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),),

              ],),
            SizedBox(height: 10,),
            Divider(),







          ],
        ),
      ),
    );
  }
}
