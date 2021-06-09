import 'dart:async';
import 'package:Quete/Utils/const.dart';
import 'package:Quete/Utils/session.service.dart';
import 'package:Quete/graphql/schema.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:stream_transform/stream_transform.dart';
import 'opt.verification.screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class BasicInfo extends StatefulWidget {
  @override
  _BasicInfoState createState() => _BasicInfoState();
}
const String _kGoogleApiKey = Constants.locationAPI;
class _BasicInfoState extends State<BasicInfo> {



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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(30),
          left: ScreenUtil().setWidth(30),
          top:ScreenUtil().setWidth(30),
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
                "Complete the profile form to start your GreenLine account   ",
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


  var fireStoreInstance = FirebaseFirestore.instance.collection('users').doc
    (UserCacheService.user.id);
  // form variables
  final _formKey = GlobalKey<FormState>();
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

  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: _kGoogleApiKey);
  // ignore: close_sinks
  StreamController<String> streamController = StreamController<String>();
  final places = List<Prediction>();
  String _tempAddress;
  FocusNode _focusUnit;
// textField controllers
  static TextEditingController _controllerAddress = TextEditingController();
  static TextEditingController _controllerFirstName = TextEditingController();
  static TextEditingController _controllerLastName = TextEditingController();
  static TextEditingController _controllerNumber = TextEditingController();
  UsersSetInput user = UsersSetInput(
    userId: UserCacheService.user.id,
    emailAddress: UserCacheService.user.email.toString(),
    firstName: _controllerFirstName.text,
    lastName: _controllerLastName.text,
    homeAddress: _controllerAddress.text,
    contactNumber: _controllerAddress.text,
  );



  @override
  void initState() {
    _focusUnit = FocusNode();
    // for address prediction
    streamController.stream
        .debounce(Duration(milliseconds: 250))
        .listen((s) => _validateValues());
    super.initState();
  }

  @override
  void dispose() {
    _focusUnit.dispose();
    super.dispose();
  }

  // address prediction
  _validateValues() async {
    var text = _controllerAddress.text;

    var placesAutocomplete = await _places.autocomplete(text,
        language: 'en',
        sessionToken:
        Provider.of<SessionService>(context, listen: false).session,
        types: ['address'],
        region: 'CA');

    places.clear();
    setState(() {
      places.addAll(placesAutocomplete.predictions);
    });
  }

  @override
  Widget build(BuildContext context) {
    var userProvider =Provider.of<AuthProvider>(context);
    _onPressed() async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        UsersSetInput user = UsersSetInput(
          userId: UserCacheService.user.id,
          emailAddress: UserCacheService.user.email.toString(),
          firstName: _controllerFirstName.text,
          lastName: _controllerLastName.text,
          homeAddress: _controllerAddress.text,
          contactNumber: _controllerNumber.text,
        );
        await userProvider.updateUser(user).then((value) {
          fireStoreInstance.set(user.toJson());
        });


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

              _addressFormField(),
              if (places.length != 0)
                Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.09),
                            offset: Offset(0, 3),
                            blurRadius: 6)
                      ]),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: places.length ?? 0,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final p = places[index];

                        return ListTile(
                          //Todo:
                          trailing: p.distanceMeters != null
                              ? Text(p.distanceMeters.toString())
                              : null,
                          leading: CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              child: Icon(
                                Icons.location_on,
                                size: 15,
                              )),
                          title: Text(p.structuredFormatting.mainText),
                          subtitle: Text(p.structuredFormatting.secondaryText),
                          onTap: () async {
                            setState(() {
                              _controllerAddress.text = p.description;
                              places.clear();
                            });

                            Future.delayed(Duration(milliseconds: 100),
                                    () => _focusUnit.requestFocus());

                            final place =
                                (await _places.getDetailsByPlaceId(p.placeId))
                                    .result;

                            final streetNumber = place.addressComponents
                                .singleWhere(
                                    (element) =>
                                    element.types.contains('street_number'),
                                orElse: () => null);
                            final route = place.addressComponents.singleWhere(
                                    (element) => element.types.contains('route'),
                                orElse: () => null);
                            final neighborhood = place.addressComponents
                                .singleWhere(
                                    (element) =>
                                    element.types.contains('neighborhood'),
                                orElse: () => null);
                            final locality = place.addressComponents
                                .singleWhere(
                                    (element) =>
                                    element.types.contains('locality'),
                                orElse: () => null);
                            final administrativeAreaLevel1 =
                            place.addressComponents.singleWhere(
                                    (element) => element.types.contains(
                                    'administrative_area_level_2'),
                                orElse: () => null);
                            final administrativeAreaLevel2 =
                            place.addressComponents.singleWhere(
                                    (element) => element.types.contains(
                                    'administrative_area_level_1'),
                                orElse: () => null);
                            final postalCode = place.addressComponents
                                .singleWhere(
                                    (element) =>
                                    element.types.contains('postal_code'),
                                orElse: () => null);
                          },
                        );
                      }),
                ),
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
                    height: ScreenUtil().setHeight(40),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:  Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
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
                "By continuing you are confirming that you agree with "
                    "GreenLine's terms and conditions",
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
       controller: _controllerFirstName,
      validator: fieldValidator,
      textCapitalization: TextCapitalization.words,
      style:  Theme.of(context).textTheme.bodyText2,
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
      controller: _controllerLastName,
      validator: fieldValidator,
        textCapitalization: TextCapitalization.words,
      style:  Theme.of(context).textTheme.bodyText2,
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
      controller: _controllerNumber,
      keyboardType: TextInputType.phone,
      validator: phoneValidator,

      style:  Theme.of(context).textTheme.bodyText2,
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

  TextFormField _addressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      autofocus: true,
      textInputAction: TextInputAction.next,
      controller: _controllerAddress,
      onChanged: (text) async {
        if (_tempAddress == text) return;
        _tempAddress = text;
        streamController.add(text);
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {});
        }
        return null;
      },
      style:  Theme.of(context).textTheme.bodyText2,
      textCapitalization: TextCapitalization.words,
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
