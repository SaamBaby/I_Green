import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class UploadDocuments extends StatelessWidget {
  cState currentState = cState.Uninitialized;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text("Submit Resume",style: TextStyle(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w900,
          fontFamily: "Futura Book",
          letterSpacing: .8,
          fontSize: ScreenUtil().setSp(16),
          color: Colors.black.withOpacity(.8),
          height: 1.3,
        ),),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.clear,color: Theme.of(context).primaryColor,),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
          (5),horizontal: ScreenUtil().setWidth(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.05),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Image.asset('assets/images/documents/upload.png',
                   width: 100,
                    height: 100,
                    color: Theme.of(context).primaryColor,),
                ),
              ),
            ),
                SizedBox(height: 50,),
                Text("By uploading you resume, you'll automatically be "
                    "considered for the jobs that match your skills and "
                    "experience.",style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Futura Book",
                  letterSpacing: 1.2,
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.black.withOpacity(.8),
                  height: 1.5,
                ),

                ),
            SizedBox(height: 100,),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,

              onTap: () {


              },
              child: AnimatedContainer(
                  margin: EdgeInsets.only(bottom: 10),
                  duration: Duration(milliseconds: 300),
                  height: ScreenUtil().setHeight(40),
                  alignment: Alignment.center,
                  width: (currentState==cState.Uninitialized)?MediaQuery.of
                    (context).size.width:ScreenUtil().setWidth(50),
                  decoration: BoxDecoration(
                    color:  Theme.of(context).primaryColor,
                    borderRadius: (currentState==cState.Uninitialized)
                        ?BorderRadius.circular(10):BorderRadius.circular(25),
                  ),
                  child: progressButton()),
            ),
            SizedBox(height: 50,),
            Row(
                children: <Widget>[
                  Expanded(
                      child: Divider()
                  ),

                  Text("or",style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Futura Book",
                    letterSpacing: 1.2,
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.black.withOpacity(.8),
                    height: 1.5,
                  )
                  ),

                  Expanded(
                      child: Divider()
                  ),
                ]
            ),
            SizedBox(height: 20,),
            FlatButton(
              onPressed: (){},
              child: Text("Create your resume",style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w900,
                fontFamily: "Futura Book",
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(13),
                color: Theme.of(context).primaryColor,
                height: 1.5,
              )
              ),
            )

            ],
        ),
      ),
    );
  }
  progressButton() {
    if(currentState==cState.Uninitialized){
      return RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(Icons.upload_file,color: Colors.white,)
            ),
            TextSpan(
              text: "  Upload resume " ,
              style:  TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w900,
                fontFamily: "Futura Book",
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(14),
                color: Colors.white,
                height: 1.5,
              ),

            )
          ]
        ),
      );
    }else if(currentState==cState.Authenticating){
      print(currentState);
      return CircularProgressIndicator(
        value: null,

        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 4.0,
      );
    } else{
      return Icon(Icons.check, color:Colors.white);
    }
  }
}
enum cState {
  Uninitialized,
  Authenticating,
  Authenticated

}