import 'package:Quete/Utils/sizeConfiguration.dart';
import 'package:Quete/models/User.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import '../../Routes.dart';

import 'forgot.password.screen.dart';
import 'signup.screen.dart';

class Login extends StatefulWidget {
  static const routName ='/login-screen';
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
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
}

class body extends StatelessWidget {
  const body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
          (15),horizontal: ScreenUtil().setWidth(20)),
        child: Column(
          children: <Widget>[
            SizedBox(height:80),
            Text(
              " Welcome Back !",
              textAlign: TextAlign.center,
              style:  Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              "Sign in with your username and password  \n or continue using our social login  ",
              textAlign: TextAlign.center,
              style:  Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: 50),
            SignInForm(),
            Row(children: <Widget>[
              Expanded(child: Divider()),
              Text(
                "Or sign in with",
                style:  Theme.of(context).textTheme.bodyText1,
              ),
              Expanded(child: Divider()),
            ]),
            socialCard(),
            RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style:  Theme.of(context).textTheme.caption,
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

enum cState {
  Uninitialized,
  Authenticating,
  Authenticated

}
class SignInFormState extends State<SignInForm> {
  cState currentState = cState.Uninitialized;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();



  @override
  void initState() {
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
    void _showErrorDialog(String message) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("An error occurred during the process ",style:
                Theme.of(context).textTheme.bodyText1,),
                content: Text(message,style:  Theme.of(context).textTheme. bodyText2,),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Okay", style: Theme.of(context).textTheme
                        .bodyText2),
                  )
                ],
              ));
    }

    _onPressed() async {
         setState(() {
           currentState=cState.Authenticating;
         });
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        await userProvider.signIn(controllerEmail.text,controllerPassword.text)
            .then((value) {
          if (value != null) {
            var errorMessage = value;
            if (value.contains('firebase_auth/email-already-in-use')) {
              errorMessage = "This Email address already exists";
            } else if (value.contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
              errorMessage = "Too many attempts to login ";
            } else if (value.contains('INVALID_ID_TOKEN')) {
              errorMessage = "Invalid Id";
            } else if (value.contains('WEAK_PASSWORD')) {
              errorMessage = "Weak password";
            } else if (value.contains('INVALID_EMAIL')) {
              errorMessage = "Invalid Email address";
            } else if (value.contains('firebase_auth/wrong-password')) {
              errorMessage = "Invalid Password";
            }
            _showErrorDialog(errorMessage);
          } else {
            setState(() {
              currentState=cState.Authenticated;
            });
            if(currentState==cState.Authenticated){
              Navigator.pushNamed(context, Routes.root);
            }
          }
        }).catchError((onError) {
          print(onError.toString());
        });
      }
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
                      checkColor: Theme.of(context).primaryColor, // color of tick Mark
                      activeColor: Colors.grey,
                      onChanged: (bool value) {
                        setState(() {
                          isCheck = value;
                        });
                      }),
                  Text(
                    "Remember me",
                    style:  Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  RichText(
                    text: TextSpan(
                        text: 'Forgot Password ?',
                        style:  Theme.of(context).textTheme.caption,
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
              SizedBox(
                height: 20,
              ),

            ]));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller:controllerPassword ,
      validator: passwordValidator,
      style:  Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        labelText: "Password",
        errorStyle: TextStyle(
            fontFamily: 'Futura Book',
            color:  Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.w700),
        labelStyle: TextStyle(
            fontFamily: 'Futura Book',
            color:  Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700),
        hintStyle:  Theme.of(context).textTheme.caption,
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
      controller: controllerEmail,
      style:  Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        labelText: "Email",
        errorStyle: TextStyle(
            fontFamily: 'Futura Book',
            color:  Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.w700),
        hintText: "Enter your Email",
        labelStyle: TextStyle(
            fontFamily: 'Futura Book',
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700),
        hintStyle:  Theme.of(context).textTheme.caption,
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

  progressButton() {
    if(currentState==cState.Uninitialized){
      return Text(
          "Sign in ",
          style: Theme.of(context).textTheme.headline3
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
