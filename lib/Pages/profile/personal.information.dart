import 'package:Quete/graphql/schema.graphql.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
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

  // static TextEditingController controllerFirstName = TextEditingController();
  // static TextEditingController controllerLastName = TextEditingController();
  // static TextEditingController controllerAddress = TextEditingController();
  // static TextEditingController controllerContactNumber = TextEditingController();
  // static TextEditingController controllerEmail = TextEditingController();


  // for updating the user info
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
  bool initSet = true;
  var  user = UsersSetInput(
    userId: UserCacheService.user.id,
    emailAddress: UserCacheService.user.email.toString(),
    firstName: '',
    lastName:  '',
    homeAddress: '',
    contactNumber: '',
  );


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final  userInfo = Provider.of<UserService>(context);
   if(initSet){
     user = UsersSetInput(
       userId: UserCacheService.user.id,
       emailAddress: userInfo.user.emailAddress,
       firstName: userInfo.user.firstName,
       lastName:   userInfo.user.lastName,
       homeAddress:  userInfo.user.homeAddress,
       contactNumber:  userInfo.user.contactNumber,
     );
     initSet= false;
   }

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },

            icon: Icon(Icons.clear,size: 18,color: Theme.of(context).primaryColor,)),
        title:  Text("Personal information",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Futura Book",
              letterSpacing: .8,
              height: 1.5,
              color: Colors.black.withOpacity(.8),
              fontSize: 18),),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
            (15),horizontal: ScreenUtil().setWidth(25)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                  children: [
                    TextFormField(
                      initialValue: user.firstName,
                      onFieldSubmitted: (value){
                        setState(() {
                          user.firstName= value;
                        });
                      },
                      validator: firstNameValidator,
                      style:  TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.black.withOpacity(.8),
                          fontSize: 14),
                      decoration: InputDecoration(
                        labelText: "First Name *",
                        errorStyle: TextStyle(
                            fontFamily: 'Futura Book',
                            color:  Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                        hintText: "Enter your first name",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
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
                      initialValue: user.lastName,
                      validator: lastNameValidator,
                      onFieldSubmitted: (value){
                        setState(() {
                          user.lastName= value;
                        });
                      },
                      style:  TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.black.withOpacity(.8),
                          fontSize: 14),
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        errorStyle: TextStyle(
                            fontFamily: 'Futura Book',
                            color:  Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                        hintText: "Enter your last name",
                        hintStyle:  TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Colors.black.withOpacity(.4),
                            fontSize: 14),
                        labelStyle:  TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
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
                      height: 10,
                    ),
                    TextFormField(
                      initialValue:user.emailAddress,
                      validator: emailValidator,
                      enableInteractiveSelection: false,
                      readOnly: true,
                      // onFieldSubmitted: (value){
                      //   setState(() {
                      //     user.emailAddress= value;
                      //   });
                      // },
                      style:  TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.black.withOpacity(.4),
                          fontSize: 14),
                      decoration: InputDecoration(
                        labelText: "Email",
                        errorStyle: TextStyle(
                            fontFamily: 'Futura Book',
                            color:  Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                        hintText: "Enter your Email",
                        hintStyle:  TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Colors.black.withOpacity(.4),
                            fontSize: 14),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
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
                      initialValue: user.contactNumber,
                      validator: contactNumberValidator,
                      onFieldSubmitted: (value){
                        setState(() {
                          user.contactNumber= value;
                        });
                      },
                      keyboardType: TextInputType.number,
                      style:   TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.black.withOpacity(.8),
                          fontSize: 14),
                      decoration: InputDecoration(
                        labelText: "Contact Number",
                        errorStyle: TextStyle(
                            fontFamily: 'Futura Book',
                            color:  Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                        hintText: "Enter your contact number",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                        hintStyle:   TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Colors.black.withOpacity(.4),
                            fontSize: 14),
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
                      initialValue: user.homeAddress,
                      validator: addressValidator,
                      onFieldSubmitted: (value){
                        setState(() {
                          user.homeAddress= value;
                        });
                      },
                      style:   TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.black.withOpacity(.8),
                          fontSize: 14),
                      decoration: InputDecoration(
                        labelText: "Address",
                        errorStyle: TextStyle(
                            fontFamily: 'Futura Book',
                            color:  Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                        hintText: "Enter your Address",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                        hintStyle:   TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Colors.black.withOpacity(.4),
                            fontSize: 14),
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
                    Divider(),
                    SizedBox(
                      height:ScreenUtil().setHeight(50),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        print("second ${UserCacheService.user.id}");
                        _onPressed(user);
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

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  progressButton() {
    if(currentState==cState.Uninitialized){
      return Text(
          "Update",
          style:  TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Futura Book",
              letterSpacing: .8,
              height: 1.5,
              color: Colors.white,
              fontSize: 18)
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

  void _onPressed(user)  async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print(user.firstName);
    Provider.of<AuthProvider>(context,listen: false).updateUser(user);

    }
  }
}
