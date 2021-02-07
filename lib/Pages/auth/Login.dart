import 'package:Quete/Utils/sizeConfiguration.dart';
import 'package:Quete/models/User.dart';
import 'package:Quete/models/http_exception.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../root.dart';
import 'ForgotPassword.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        title: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Futura Book',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
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
            top: getProportionateScreenWidth(2, mediaQuery)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              " Welcome Back !",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Futura Heavy',
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              "Sign in with your username and password  \n or continue using our social login  ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Futura Book',
                  color: Colors.black.withOpacity(.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 50),
            SignInForm()
          ],
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controllerEmail.text = FirebaseAuth.instance.currentUser.email;
    });

    super.initState();
  }

  String password;
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'enter a valid email address'),
  ]);

  @override
  Widget build(BuildContext context) {
    var isCheck = false;
    var userProvider = Provider.of<AuthProvider>(context);
    void _showErrorDialog(String message){
      showDialog(context:context, builder:(context)=>AlertDialog(
        title: Text("An error occurred during the process "),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: (){Navigator.of(context).pop();},
            child: Text("Okay"),
          )
        ],

      ));
    }
    _onPressed() async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        try {
          await userProvider.signIn(user);
        } on HttpException catch (e) {
          var errorMessage = "Authentication Failed";
          if (e.toString().contains('EMAIL_EXISTS')) {
            errorMessage = "This Email address already exists";
          } else if (e.toString().contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
            errorMessage = "Too many attempts to login ";
          } else if (e.toString().contains('INVALID_ID_TOKEN')) {
            errorMessage = "Invalid Id";
          } else if (e.toString().contains('WEAK_PASSWORD')) {
            errorMessage = "Weak password";
          } else if (e.toString().contains('INVALID_EMAIL')) {
            errorMessage = "Invalid Email address";
          } else if (e.toString().contains('INVALID_PASSWORD')) {
            errorMessage = "Invalid Password";
          }
          _showErrorDialog(errorMessage);
        } catch (e) {
          if ((e.toString()).contains('called on null')) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Root()));
          }
        }}
    }

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildEmailFormField(),
              SizedBox(
                height: 20,
              ),
              buildPasswordFormField(),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                      value: isCheck,
                      checkColor: Colors.yellowAccent, // color of tick Mark
                      activeColor: Colors.grey,
                      onChanged: (bool value) {
                        setState(() {
                          isCheck = value;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black.withOpacity(.5),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  RichText(
                    text: TextSpan(
                        text: 'Forgot Password ?',
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.black.withOpacity(.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          }),
                  ),
                ],
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
                      "Sign in ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Futura Heavy',
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(
                  "Or sign in with",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black.withOpacity(.5),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Divider()),
              ]),
              socialCard(),
              RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black.withOpacity(.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Sign up',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            })
                    ]),
              ),
            ]));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      validator: passwordValidator,
      onSaved: (value) {
        user = UserModel(password: value, email: user.email);
      },
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

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: emailValidator,
      onSaved: (value) {
        user = UserModel(email: value, password: user.password);
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
          horizontal: getProportionateScreenWidth(30, mediaQuery),
          vertical: 30),
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
