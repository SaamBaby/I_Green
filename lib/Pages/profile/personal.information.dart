import 'package:Quete/services/graphql/user.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';


class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}
enum cState {
  Uninitialized,
  Authenticating,
  Authenticated

}
class _PersonalInformationState extends State<PersonalInformation> {

  cState currentState = cState.Uninitialized;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerContactNumber = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();


  String password;
  final firstNameValidator = MultiValidator([
    RequiredValidator(errorText: 'First Name is required'),
  ]);
  final lastNameValidator = MultiValidator([
    RequiredValidator(errorText: 'Last Name is required'),
  ]);
  final contactNumberValidator = MultiValidator([
    RequiredValidator(errorText: 'First Name is required'),
  ]);
  final addressValidator = MultiValidator([
    RequiredValidator(errorText: 'First Name is required'),
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'enter a valid email address'),
  ]);
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserService>(context);
    return Scaffold(
    
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
              (15),horizontal: ScreenUtil().setWidth(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.clear,size: 18,)),
                    SizedBox(width: 10,),
                    Text("Personal Info",
                        style: Theme.of(context).textTheme.headline1),
                    Spacer(),
                    Text("FAQS ?",
                      style: TextStyle(
                          fontFamily: 'Futura Book',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),)
                  ],),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: controllerFirstName..text= userInfo.user.firstName,
                  validator: emailValidator,
                  style:  Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    errorStyle: TextStyle(
                        fontFamily: 'Futura Book',
                        color:  Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                    hintText: "Enter your first name",
                    labelStyle: Theme.of(context).textTheme.subtitle2,
                    hintStyle:  Theme.of(context).textTheme.caption,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                      child: SvgPicture.asset(
                        "assets/icons/User.svg",
                        height: 18,
                        color:  Colors.red,
                      ),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
            TextFormField(
              controller: controllerLastName..text= userInfo.user.lastName,
              validator: emailValidator,
              style:  Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                labelText: "Last Name",
                errorStyle: TextStyle(
                    fontFamily: 'Futura Book',
                    color:  Colors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
                hintText: "Enter your last name",
                hintStyle:  Theme.of(context).textTheme.caption,
                labelStyle: Theme.of(context).textTheme.subtitle2,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: SvgPicture.asset(
                    "assets/icons/User.svg",
                    height: 18,
                    color:  Colors.red,
                  ),
                ),
              ),
            ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controllerEmail..text= userInfo.user.emailAddress,
                  validator: emailValidator,
                  style:  Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    labelText: "Email",
                    errorStyle: TextStyle(
                        fontFamily: 'Futura Book',
                        color:  Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                    hintText: "Enter your Email",
                    hintStyle:  Theme.of(context).textTheme.caption,
                    labelStyle: Theme.of(context).textTheme.subtitle2,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                      child: SvgPicture.asset(
                        "assets/icons/Mail.svg",
                        height: 18,
                        color:  Colors.red,
                      ),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: controllerContactNumber..text= userInfo.user.contactNumber,
                  validator: emailValidator,
                  style:  Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    labelText: "Contact Number",
                    errorStyle: TextStyle(
                        fontFamily: 'Futura Book',
                        color:  Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                    hintText: "Enter your contact number",
                    labelStyle: Theme.of(context).textTheme.subtitle2,
                    hintStyle:  Theme.of(context).textTheme.caption,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                      child: SvgPicture.asset(
                        "assets/icons/Call.svg",
                        height: 18,
                      ),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controllerAddress..text= userInfo.user.homeAddress,
                  validator: emailValidator,
                  style:  Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    labelText: "Address",
                    errorStyle: TextStyle(
                        fontFamily: 'Futura Book',
                        color:  Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                    hintText: "Enter your Address",
                    labelStyle: Theme.of(context).textTheme.subtitle2,
                    hintStyle:  Theme.of(context).textTheme.caption,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                      child: SvgPicture.asset(
                        "assets/icons/Discover.svg",
                        height:30,
                      ),
                    ),
                  ),
                ),
                      Spacer(),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,

                  onTap: () {
                    print(userInfo.user.firstName);

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

              ],
            ),
          ),
        ),
      )
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
