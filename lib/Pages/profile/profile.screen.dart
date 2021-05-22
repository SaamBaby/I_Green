import 'package:Quete/Routes.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:Quete/services/graphql/user.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';


class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,toolbarHeight: 20, automaticallyImplyLeading: false,),
        body: Container(
          padding: EdgeInsets.symmetric(vertical:0,horizontal: 25),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.clear,size: 18,)),
                  SizedBox(width: 10,),
                  Text("My Account",
                      style: Theme.of(context).textTheme.headline1),
                  Spacer(),
                  Text("FAQS ?",

                    style:  Theme.of(context).textTheme.bodyText2)
                ],),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.personalInformation);
                    },
                    child: Text("Personal Information",
                        style: Theme.of(context).textTheme.bodyText2),
                  ),

                ],),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 20,),
                  Text("Availabilities",
                      style: Theme.of(context).textTheme.bodyText2),

                ],),

              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.insert_drive_file),
                  SizedBox(width: 20,),
                  Text("Documents",
                      style: Theme.of(context).textTheme.bodyText2),

                ],),
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.analytics_rounded),
                  SizedBox(width: 20,),
                  Text("Activities",
                      style: Theme.of(context).textTheme.bodyText2),

                ],),
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.settings_rounded),
                  SizedBox(width: 20,),
                  Text("Settings",
                      style: Theme.of(context).textTheme.bodyText2),

                ],),
              SizedBox(height: 10,),
              Divider(),

              Consumer<AuthProvider>(
                builder: (context, user, _)=> Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actionsPadding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
                                (15),horizontal: ScreenUtil().setWidth(20)),
                              title: Text( "Are your sure you want to sign out? " ,style: Theme.of(context).textTheme.bodyText2,),
                              actions: <Widget>[

                                FlatButton(
                                  onPressed:(){
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                      "Cancel", style: Theme.of(context).textTheme.bodyText2
                                  ),
                                ),
                                RaisedButton(

                                  onPressed:(){
                                    user.signOut();
                                  },
                                  color:Theme.of(context).primaryColor,
                                  child: Text(
                                      "OK",
                                      style: Theme.of(context).textTheme.button
                                  ),
                                ),
                              ],
                            ));

                      },
                      child: Text("Logout",
                          style: Theme.of(context).textTheme.bodyText2),
                    ),

                  ],),
              ),
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.info),
                  SizedBox(width: 20,),
                  Text("About Us",
                      style: Theme.of(context).textTheme.bodyText2),

                ],),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.shield),
                  SizedBox(width: 20,),
                  Text("Privacy Policy",
                      style: Theme.of(context).textTheme.bodyText2),

                ],),
              SizedBox(height: 10,),
              Divider(),







            ],
          ),
        ),
    );
  }
}
