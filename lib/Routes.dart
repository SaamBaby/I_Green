import 'package:Quete/Pages/home/home.screen.dart';
import 'package:Quete/Pages/profile/personal.information.dart';
import 'package:Quete/Pages/schedule/schedule.maps.screen.dart';
import 'package:Quete/services/helper/circle.transicion.route.dart';
import 'package:flutter/material.dart';

import 'Pages/auth/forgot.password.screen.dart';
import 'Pages/auth/login.screen.dart';
import 'Pages/auth/opt.verification.screen.dart';
import 'Pages/auth/signUp.profie.screen.dart';
import 'Pages/auth/signup.screen.dart';
import 'Pages/home/home.cloesed.job.details.dart';
import 'Pages/introduction/notConnected.screen.dart';
import 'Pages/introduction/onBoard.screen.dart';
import 'Pages/introduction/splash.screen.dart';
import 'Pages/notification/notifications.screen.dart';
import 'Pages/profile/profile.screen.dart';
import 'Pages/root.page.dart';
import 'Pages/schedule/schedule.stopwatch.screen.dart';

class Routes{

  static const root = '/';

  // introduction
  static const onBoard='/onBoard';
  static const splash='/splash';
  static const notConnected='/notConnected';


  // auth
  static const authLogin = '/auth/login';
  static const authSignUp = '/auth/register';
  static const authSignUpProfile = '/auth/register/profile';
  static const authProfilePhoto = '/auth/profile-photo';
  static const authEmailVerify = '/auth/email-verify';
  static const otpVerify = '/auth/otp-verify';
  static const forgotPassword = '/auth/email-verify';

  // settings
  static const settings = '/settings';
  static const settingsEditProfile = '/settings/account/edit-profile';
  static const settingsEditProfileGender = '/settings/account/edit-profile/gender';
  static const settingsEditProfileLocation = '/settings/account/edit-profile/location'; // not used fn
  static const settingsEmailEdit = '/settings/account/email/edit';
  static const settingsEmailVerify = '/settings/account/email/verify';
  static const settingsPhoneEdit = '/settings/account/phone/edit';
  static const settingsPhoneVerify = '/settings/account/phone/verify';
  static const settingsCredentials = '/settings/account/credentials';

  // home
  static const homeMain = '/home/main';
  static const jobDetails = 'home/job-details';



  // user
  static const personalInformation = '/user/profile/personalInformation';
  static const userProfile = '/user/profile';

  // discovery
  static const discovery = '/disovery';

  // user dashboard
  static const userDashboard = 'user/dashboard';


  // Verification Center
  static const verificationCenter = '/verification-center';
  static const verificationCenterRequest = '/verification-center/request';
  static const verificationCenterSuccessful = '/verification-center/successful';

  // Notification
  static const notifications = '/notifications';

  // Schedule
  static const schedule = '/schedule/calender';
  static const map = '/schedule/maps';
  static const stopWatch = '/schedule/stopWatch';


  static PageRouteBuilder generateRoute(RouteSettings routeSettings, {Widget
  root, bool isCustomTransicion}) {
    if (isCustomTransicion) {
      return CircleTransicionRoute(
        settings: routeSettings,
        page: _buildPage(routeSettings.name, routeSettings.arguments, root),
      );
    }
    else {
      return NoTransicionRoute(
        settings: routeSettings,
        page: _buildPage(routeSettings.name, routeSettings.arguments, root),
      );
    }
  }



  static Widget _buildPage(String name, Object arguments, Widget newRoot) {
    switch (name) {
      case root:
        return newRoot ??  Root();
      case onBoard:
        return OnBoard();
      case notConnected:
        return NotConnected();
      case authLogin:
        return Login();
      case otpVerify:
        return OtpVerification();
      case authSignUp:
        return SignUp();
      case authSignUpProfile:
        return BasicInfo();
      case forgotPassword:
        return ForgotPassword();
    // home
      case homeMain:
        return ShiftFeeds();
      case jobDetails:
        return JobDetails(closedShiftId: arguments,);

        // schedule
      case map:
        return LocationMap(arguments: arguments);
      case stopWatch:
                return ScheduleStopWatch();
        // user profile
      case userProfile:
         return Profile();

      case personalInformation:
        return PersonalInformation();

      case  splash:
        return Splash();
      // Notification
      case notifications:
        return Notifications();
        //


      default:
        return Container(
          color: Colors.white,
        ); // TODO: CREATE NOT FOUND PAGE
    }
  }
}
