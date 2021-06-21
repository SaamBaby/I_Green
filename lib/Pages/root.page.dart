import 'package:Quete/Pages/schedule/schedule.screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat/chatRoom.screen.dart';
import 'home/home.screen.dart';
import 'profile/history/profile.shift.history.dart';


class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;
    PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffeaeaea)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffeaeaea),
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: BottomNavyBar(
          animationDuration: Duration(milliseconds: 500),
          selectedIndex: _currentIndex,
          showElevation: false,
          // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 25,
                ),
                title: Text(
                  'Home',
                  style: Theme.of(context)
                      .textTheme.bodyText2
                ),
                activeColor: Color(0xFF24D665),
                inactiveColor: Color(0xffdfe6eb)),

            BottomNavyBarItem(
                icon: Icon(Icons.timer,size: 24),
                title: Text(
                    'Schedule',
                  style:Theme.of(context)
                      .textTheme.bodyText2,
                ),
                activeColor:Color(0xFF54E597),
                inactiveColor: Color(0xffdfe6eb)),
            BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.facebookMessenger,size: 20,),
                title: Text(
                  'ChatRoom',
                  style: Theme.of(context)
                      .textTheme.bodyText2,
                ),
                activeColor: Color(0xFF54E597),
                inactiveColor: Color(0xffdfe6eb)),
            BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.history,size: 20,),
                title: Text(
                  'History',
                  style: Theme.of(context)
                      .textTheme.bodyText2,
                ),
                activeColor: Color(0xFF54E597),
                inactiveColor: Color(0xffdfe6eb))
          ],
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            ShiftFeeds(),
            Schedule(),
            ChatRoom(),
            ShiftHistory()


          ],
        ),
      ),
    );
  }
}
