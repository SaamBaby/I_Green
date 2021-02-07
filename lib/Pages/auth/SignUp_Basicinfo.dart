import 'dart:async';

import 'package:Quete/Utils/sizeConfiguration.dart';
import 'package:Quete/models/User.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:stream_transform/stream_transform.dart';

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
     resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: body(),
    );
  }

  Widget _appBar() => AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 60,
        title: Text(
          "Step Two",
          style: TextStyle(color: Colors.black),
        ),
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: getProportionateScreenWidth(30, mediaQuery),
          left: getProportionateScreenWidth(30, mediaQuery),
          top: getProportionateScreenWidth(30, mediaQuery),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
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
  static var _kGoogleApiKey = "AIzaSyACcwHClXpnQmR20ZSCOPuamWCK8CFB6ZE";
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: _kGoogleApiKey);

  final fieldValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    MinLengthValidator(2,
        errorText: 'This field must be minimum 2 digits long'),
  ]);
  final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    MinLengthValidator(10,
        errorText: 'This field must be minimum 2 digits long'),
    PatternValidator(r'^[0-9]{10}$',
        errorText: 'passwords must have at least one special character')
  ]);
  final _controllerAddress = TextEditingController();

  FocusNode _focusUnit;

  var user = UserModel(
      firstName: '',
      lastName: '',
      address: '',
      email: '',
      phoneNumber: 0,
      password: '',
      id: '');

  @override
  void initState() {
    _focusUnit = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusUnit.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var userProvider =Provider.of<AuthProvider>(context);
    _onPressed() async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        await userProvider.updateUser(user);


        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpVerification()));
      }
    }
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

              SizedBox(height: 20),
              _phoneNumberFormField(),

              SizedBox(height: 20),

              _adressFormField(),
              SizedBox(
                height: 20,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _onPressed();
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
      validator: fieldValidator,
      onSaved: (value) {
        user = UserModel(
            email: user.email,
            id: user.id,
            firstName: value,
            lastName: user.lastName,
            phoneNumber: user.phoneNumber,
            password: user.password,
            address: user.address);
      },
      decoration: InputDecoration(
        labelText: "First name",
        hintText: "Enter your First name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(Icons.lock),
        ),
      ),
    );
  }

  TextFormField _lastNameFormField() {
    return TextFormField(
      validator: fieldValidator,
      onSaved: (value) {
        user = UserModel(
            email: user.email,
            id: user.id,
            firstName: user.firstName,
            lastName: value,
            phoneNumber: user.phoneNumber,
            password: user.password,
            address: user.address);
      },
      decoration: InputDecoration(
        labelText: "Last name",
        hintText: "Enter your Last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(Icons.lock),
        ),
      ),
    );
  }

  TextFormField _phoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: phoneValidator,
      onSaved: (value) {
        user = UserModel(
            email: user.email,
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            phoneNumber:int.parse(value),
            password: user.password,
            address: user.address);
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "+1 111-222-3333",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(Icons.email),
        ),
      ),
    );
  }

  TextFormField _adressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      onSaved: (value) {
        user = UserModel(
            email: user.email,
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            phoneNumber:user.phoneNumber,
            password: user.password,
            address: value);
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {});
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Street address",
        hintText: "Enter your street address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(Icons.email),
        ),
      ),
    );
  }
}
