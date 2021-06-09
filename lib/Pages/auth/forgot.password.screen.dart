import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: body(),
    );
  }

  Widget _appBar() => AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    toolbarHeight: 80,
    title: Text("Forgot Password",style: TextStyle(color: Colors.black),),
    iconTheme: IconThemeData(
      color: Colors.black,
      //change your color here
    ),
  );
}

class body extends StatelessWidget {
  const body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(30),left:
        ScreenUtil().setWidth(30),right: ScreenUtil().setWidth(30)),

        child: Column(
          children: <Widget>[
            Text(
              "Forgot your Password ?",
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
              "Please enter your email that you provided and we will send a link to your email account to reset the passoword ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Futura Book',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 50),
            ForgotPasswordForm()
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  ForgotPasswordFormState createState() {
    return ForgotPasswordFormState();
  }
}

class ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = ["Demo Error"];

  @override
  Widget build(BuildContext context) {
    var isCheck = false;
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildEmailFormField(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
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

            ]));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: SvgPicture.asset(
            "assets/icons/Lock.svg",
            height: 18,
          ),
        ),
      ),
    );
  }
  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter  your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: SvgPicture.asset(
            "assets/icons/Lock.svg",
            height: 18,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            errors.add("Please enter your email address");
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: SvgPicture.asset(
            "assets/icons/Mail.svg",
            height: 18,
          ),
        ),
      ),
    );
  }
}

class socialCard extends StatelessWidget {
  get mediaQuery => MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(30),
          vertical: ScreenUtil().setWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 40,
                  alignment: Alignment.center,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF3f64ac),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 20,
                  ))),
          SizedBox(
            width: 10,
          ),
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 40,
                  alignment: Alignment.center,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                    size: 20,
                  ))),
          SizedBox(
            width: 10,
          ),
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 40,
                  alignment: Alignment.center,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.white,
                    size: 20,
                  ))),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
