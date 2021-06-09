import 'package:Quete/Routes.dart';
import 'package:Quete/services/graphql/user.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';


class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserService>(context);
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          centerTitle: false,
          leading:  IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.clear,size: 18,)),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(Routes.settings);
                },
                icon: Icon(Icons.more_vert_outlined,size: 18,))
          ],
          title: Text("My Account",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: "Futura Book",
                  letterSpacing: .8,
                  height: 1.5,
                  color: Colors.black.withOpacity(.8),
                  fontSize: 18),),
          automaticallyImplyLeading: true,
        ),


        body: Container(
          padding: EdgeInsets.symmetric(vertical:10,horizontal: 20),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                          Expanded(
                            flex:1,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50.0,
                            backgroundImage: (false)?NetworkImage
                              ("https://images"
                                ".unsplash"
                                ".com/photo-1621570274061-6b0c42c7bd13?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"):
                            AssetImage
                              ('assets/images/miscellaneous/default-pic.png'),
                        ),
                          ),
                       SizedBox(width: 10,),
                       Expanded(
                         flex: 2,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: 20,),
                             RichText(
                               text: TextSpan(
                                 children: [
                                   TextSpan(
                                     text: userInfo.user.firstName,
                                   style:  Theme.of(context).textTheme.headline5
                                   ),
                                   TextSpan(
                                       text: userInfo.user.lastName,
                                       style:  Theme.of(context).textTheme.headline5
                                   ),
                                 ]
                               ),
                               textAlign: TextAlign.start,
                               overflow: TextOverflow.clip,
                             ),
                             RichText(
                               text: TextSpan(

                                   text:userInfo.user.homeAddress.replaceAll(',', ' .').split(""
                                       ".").first ,
                                   style:  TextStyle(
                                       fontFamily: 'Futura Book',
                                       color: Colors.black.withOpacity(.6),
                                       fontSize: 12,
                                       height: 1.5,
                                       letterSpacing: .8,
                                       fontWeight: FontWeight.bold),
                                   children: <TextSpan>[
                                     TextSpan(
                                       text: ' . ',
                                       style:
                                       TextStyle(
                                           fontFamily: 'Futura Book',
                                           color: Colors.black.withOpacity(.6),
                                           fontSize: 12,
                                           height: 1.5,
                                           letterSpacing: .8,
                                           fontWeight: FontWeight.bold),
                                     ),
                                     TextSpan(

                                       text:
                                       (userInfo.user.homeAddress
                                           .replaceAll(', ', ''
                                           '.').split('.').last).toString().split(' ').first,
                                       style:  TextStyle(
                                           fontFamily: 'Futura Book',
                                           color: Colors.black.withOpacity(.6),
                                           fontSize: 12,
                                           height: 1.5,
                                           letterSpacing: .8,
                                           fontWeight: FontWeight.bold),

                                     ),
                                   ]),
                             ),

                           ],
                         ),
                       )

                     ],
                   ),
                 SizedBox(height: 10,),
                Divider(),
                SizedBox(width: 10,),
                Text(
                  "About",
                  textAlign: TextAlign.start,
                  style:TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: .8,
                      height: 1.5,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 16),),
                SizedBox(height: 10,),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam maximus, urna non mollis tempus, massa mi placerat tortor, ac vulputate tellus enim ac lorem.",
                  textAlign: TextAlign.start,
                  style:TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: .8,
                      height: 1.5,
                      color: Colors.black.withOpacity(.6),
                      fontSize: 13),),
                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                     Navigator.of(context).pushNamed(Routes.personalInformation);
                  },
                  child: ListTile(
                    leading: Icon(Icons.info,color: Colors.blueAccent,),
                      contentPadding: EdgeInsets.symmetric(vertical: 5,
                          horizontal: 20),
                      title: Text(
                        "Personal-info",
                        textAlign: TextAlign.start,
                        style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Colors.black.withOpacity(.8),
                            fontSize: 14),),

                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                    ),
                  ),
            Divider(),
            ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5,
                        horizontal: 20),
                    leading: Icon(Icons.work,color: Colors.red,),
                    title: Text(
                      "Work- experience",
                      textAlign: TextAlign.start,
                      style:TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.black.withOpacity(.8),
                          fontSize: 14),),

                    trailing: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                  ),
                Divider(),

            ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10,
                        horizontal: 20),
                    leading: Icon(Icons.book,color:Colors.orange,),
                    title: Text(
                      "Education",
                      textAlign: TextAlign.start,
                      style:TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.black.withOpacity(.8),
                          fontSize: 14),),

                    trailing: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                  ),
                Divider(),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(Routes.userDocuments);
                  },
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,
                          horizontal: 20),
                      leading: Icon(Icons.alternate_email_sharp,color: Theme.of(context)
                          .primaryColor,),
                      title: Text(
                        "Documents",
                        textAlign: TextAlign.start,
                        style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Colors.black.withOpacity(.8),
                            fontSize: 14),),

                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                    ),
                  ),






              ],
            ),
          )
        ),
    );
  }
}
