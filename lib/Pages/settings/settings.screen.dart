import 'package:Quete/graphql/schema.graphql.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        centerTitle: false,
        leading:  IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.clear,size: 18,)),
        title: Text("Settings",
            style:TextStyle(
                fontFamily: 'Futura Book',
                color: Colors.black.withOpacity(.8),
                fontSize: 18,
                height: 1.5,
                letterSpacing: .8,
                fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: true,
      ),


      body: Container(
        child:ListView(
          children:  <Widget>[
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                  "General Settings",
                  style:  Theme.of(context).textTheme.headline5),
            ),
            GestureDetector(
              onTap: (){
              },
              child: Container(
                color: Colors.white.withOpacity(.9),
                child: ListTile(
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                  ),
                 contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:
                 5),
                  title: Text('Change Username',
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black.withOpacity(.8),
                      fontSize: 14,
                      height: 1.5,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),),),

              ),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white.withOpacity(.9),
                child: ListTile(
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:
                  5),
                  title: Text('Change Password',
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black.withOpacity(.8),
                        fontSize: 14,
                        height: 1.5,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold),),),

              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                  "Contact & Policies",
                  style:  Theme.of(context).textTheme.headline5),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white.withOpacity(.9),
                child: ListTile(
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:
                  5),
                  title: Text('Terms of use',
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black.withOpacity(.8),
                        fontSize: 14,
                        height: 1.5,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold),),),

              ),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white.withOpacity(.9),
                child: ListTile(
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:
                  5),
                  title: Text('Privacy policy',
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black.withOpacity(.8),
                        fontSize: 14,
                        height: 1.5,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold),),),

              ),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white.withOpacity(.9),
                child: ListTile(
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:
                  5),
                  title: Text('Contact us',
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black.withOpacity(.8),
                        fontSize: 14,
                        height: 1.5,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold),),),

              ),
            ),

            Consumer<AuthProvider>(
              builder: (context, user, _) => GestureDetector(
                onTap: ()
                {
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
                child: Container(
                  color: Colors.white.withOpacity(.9),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:
                    5),
                    title: Text('Sign out',
                      style: TextStyle(
                          fontFamily: 'Futura Book',
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          height: 1.5,
                          letterSpacing: .8,
                          fontWeight: FontWeight.bold),),),

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
