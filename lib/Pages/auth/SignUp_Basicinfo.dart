import 'package:Quete/Utils/sizeConfiguration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'OTP_Verification.dart';

class BasicInfo extends StatefulWidget {
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  get mediaQuery => MediaQueryData.fromWindow(WidgetsBinding.instance.window);

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
    title: Text("Step Two",style: TextStyle(color: Colors.black),),
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
        padding: EdgeInsets.only(
            right: getProportionateScreenWidth(30, mediaQuery),
            left: getProportionateScreenWidth(30, mediaQuery),
            top: getProportionateScreenWidth(30, mediaQuery)),
        child: Column(
          children: <Widget>[
            Text(
              " Complete your profile ",
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
              "Complete the profile form to start your Greenline account   ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Futura Book',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 50),
            SignUpForm()
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
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
              _firstNameField(),
              SizedBox(
                height: 20,
              ),
              _lastNameFormField(),
//              FormError(errors: errors),
              SizedBox(height: 20),
              _phoneNmberFormField(),
//              FormError(errors: errors),
              SizedBox(height: 20),
              _adressFormField(),
              SizedBox(
                height: 20,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> OtpVerification()));

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
              SizedBox(
                height: 20,
              ),

              Text(
                "By continuing you are confirming that you agree with Greenline's terms and conditions",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Futura Book',
                    color: Colors.black.withOpacity(.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),


            ]));
  }

  TextFormField _firstNameField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "First name",
        hintText: "Enter your First name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(
              Icons.lock
          ),
        ),
      ),
    );
  }
  TextFormField _lastNameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Last name",
        hintText: "Enter your Last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(
              Icons.lock
          ),
        ),
      ),
    );
  }

  TextFormField _phoneNmberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            errors.add("Please enter your Phone number");
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(
            Icons.email
          ),
        ),
      ),
    );
  }
  TextFormField _adressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            errors.add("Please enter your street address");
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Street address",
        hintText: "Enter your street address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(
              Icons.email
          ),
        ),
      ),
    );
  }
}


