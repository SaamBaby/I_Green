import 'package:Quete/Pages/auth/SignUp_Basicinfo.dart';
import 'package:Quete/Utils/sizeConfiguration.dart';
import 'package:Quete/models/User.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: body(),
    );
  }

  Widget _appBar() => AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          "Step One",
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
            top: getProportionateScreenWidth(0, mediaQuery)),
        child: Column(
          children: <Widget>[
            Text(
              " Register a Greenline account",
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
              "Complete the sign up form   \n or continue using our social media sign up   ",
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
 TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
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
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
//    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'enter a valid email address'),
  ]);



  @override
  Widget build(BuildContext context) {
    var userProvider =Provider.of<AuthProvider>(context);
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
     _onPressed() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        userProvider.signUp(user).then((value) {
          if(value!=null){
            var errorMessage="Please try again later";
            if(value.contains('firebase_auth/email-already-in-use')){
              errorMessage = "This Email address already exists";
            }else if (value.contains('auth/wrong-password')) {
              errorMessage = "Wrong Password ";
            } else if (value.contains('auth/invalid-user-token')) {
              errorMessage = "Invalid Id";
            } else if (value.contains('auth/network-request-failed')) {
              errorMessage = "No Network Connectivity";
            } else if (value.contains('invalid-email')) {
              errorMessage = "Invalid Email address";
            } else if (value.contains('auth/null-user')) {
              errorMessage = "User Credentials Not Found";
            }
            _showErrorDialog(errorMessage);
          }else{
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BasicInfo()));
          }

        }).catchError((onError){
          print(onError.toString());

        });


      }
    }

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controllerEmail,
                validator: emailValidator,
                onSaved: (value) {
                  user = UserModel(
                      email: value,
                      id: user.id,
                      firstName: user.firstName,
                      lastName: user.lastName,
                      phoneNumber: user.phoneNumber,
                      password: user.password,
                      address: user.address);
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Icon(Icons.email),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: passwordValidator,
                obscureText: false,
                controller: controllerPassword,
                onSaved: (value) {
                  user = UserModel(
                      email: user.email,
                      id: user.id,
                      firstName: user.firstName,
                      lastName: user.lastName,
                      phoneNumber: user.phoneNumber,
                      password: value,
                      address: user.address);
                },
                onChanged: (val) => password = val,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
//              FormError(errors: errors),
              SizedBox(height: 20),
              TextFormField(
                controller: controllerConfirmPassword,
                obscureText: false,
                validator: (val) =>
                    MatchValidator(errorText: 'passwords do not match')
                        .validateMatch(val, password),
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Re-enter  your Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
              Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(
                  "Or sign in with",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Expanded(child: Divider()),
              ]),
              socialCard(),
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
