import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: _appBar(),
      body: Body(),
    );
  }

  Widget _appBar() => AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          "OTP Verification",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
          //change your color here
        ),
      );
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Padding(
        padding: EdgeInsets.only(
            right: ScreenUtil().setWidth(30),
            left: ScreenUtil().setWidth(30),
            top: ScreenUtil().setWidth(30)),
        child: Column(
          children: <Widget>[
            Text(
              "OTP Verification",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Futura Heavy',
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We have send a code to +1 249 989 ****",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Futura Book',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "The code will expire in ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                TweenAnimationBuilder(
                  tween: Tween(begin: 60.0, end: 0),
                  duration: Duration(seconds: 60),
                  builder: (context, value, child) =>
                      Text("00:${value.toInt()}"),
                )
              ],
            ),
            SizedBox(height: 50),
            OTPverificationForm()
          ],
        ),
      ),
    );
  }
}

class OTPverificationForm extends StatefulWidget {
  @override
  OTPverificationFormState createState() {
    return OTPverificationFormState();
  }
}

class OTPverificationFormState extends State<OTPverificationForm> {
  final _formKey = GlobalKey<FormState>();


  FocusNode _focusNode2;
  FocusNode _focusNode3;
  FocusNode _focusNode4;

  @override
  void initState() {

    _focusNode2=FocusNode();
    _focusNode3=FocusNode();
    _focusNode4=FocusNode();
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _focusNode2.dispose();
  //   _focusNode3.dispose();
  //   _focusNode4.dispose();
  //
  // }

  void _autoFocus({String value, FocusNode focusNode}){
    if(value.length==1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60,
                    child: TextFormField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      onChanged: (value){
                        _autoFocus(value:value,focusNode: _focusNode2);
                      },
                    ),
                  ),

                  SizedBox(
                    width: 60,

                    child: TextFormField(
                      focusNode: _focusNode2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.never,

                      ),
                      onChanged: (value){
                        _autoFocus(value:value,focusNode: _focusNode3);
                      },
                    ),
                  ),

                  SizedBox(
                    width: 60,
                    child: TextFormField(
                      focusNode: _focusNode3,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      onChanged: (value){
                        _autoFocus(value:value,focusNode: _focusNode4);
                      },
                    ),
                  ),

                  SizedBox(
                    width: 60,
                    child: TextFormField(
                      focusNode: _focusNode4,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                child: AnimatedContainer(
                    margin: EdgeInsets.only(bottom: 10),
                    duration: Duration(milliseconds: 300),
                    height: 60,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFa6e76c),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Futura Heavy',
                      ),
                    )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.3,),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                child: AnimatedContainer(
                    margin: EdgeInsets.only(bottom: 10),
                    duration: Duration(milliseconds: 300),
                    height: 60,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Resend the code",

                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black.withOpacity(.4),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Futura Heavy',
                      ),
                    )),
              ),
            ]));
  }
}
