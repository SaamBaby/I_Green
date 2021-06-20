import 'dart:io';
import 'package:Quete/Pages/profile/documents/profile.document.preview.dart';
import 'package:Quete/Utils/Widgets/pickers/file.pickers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/screen_util.dart';

class UploadDocuments extends StatefulWidget {
  @override
  _UploadDocumentsState createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  cState currentState = cState.Uninitialized;
  bool previewAvailable = false;
  File uploadedFile;
  String uploadedFileName;

  Future getDocument() async {
    final pickedFile = await FilePickers.pickDocs().then((value) =>{
      if(value==null){
        print('No image selected.'),
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black.withOpacity(.6),
          content: Text("Please select a valid image as your profile "
              "picture",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: "Futura Book",
                letterSpacing: .8,
                height: 1.5,
                color: Colors.white,
                fontSize: 12),),
        )
    )
      } else{
            setState(() {
            uploadedFile=File(value.path);
            previewAvailable= true;
            uploadedFileName= value.name;

            })
    }});
  }

  @override
  Widget build(BuildContext context) {
    return previewAvailable? (uploadedFile == null || uploadedFile.path.isEmpty)
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 50,
          title: Text(uploadedFileName,style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Futura Book",
              letterSpacing: .8,
              height: 1.5,
              color: Colors.black,
              fontSize: 16),),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.check,size:25,color: Theme.of(context)
                  .primaryColor,),
            )
          ],
        ),
        body: Container(
            child: PDFView(
              filePath: uploadedFile.path,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
              onRender: (_pages) {
                setState(() {
                });
              },
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                // _controller.complete(pdfViewController);
              },
              onPageChanged: (int page, int total) {
                print('page change: $page/$total');
              },
            ))):Scaffold(
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

              onTap: () async {
                getDocument();
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