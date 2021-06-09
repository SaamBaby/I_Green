import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import '../../Routes.dart';


class OnBoard extends StatefulWidget {
  static const routName ='/onboard-screen';
  @override
  _OnBoardState createState() => _OnBoardState();
}



class _OnBoardState extends State<OnBoard> {

  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            actions: <Widget>[
              Padding(

                  padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
                    (15),horizontal: ScreenUtil().setWidth(20)),
                  child:
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      _pageController.jumpToPage(2);
                    },
                    child: Text('Skip', style:Theme.of(context).textTheme
                        .caption ),

                  )

              )
            ],
          ),
          body: Container(
            padding:  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
              (15),horizontal: ScreenUtil().setWidth(20)),

            child: Column(
                children: <Widget>[
                  Expanded(
                    flex:8,
                    child: Container(
                      width: ScreenUtil().setWidth(480),

                      child: PageView(
                        onPageChanged: (int page) {
                          setState(() {
                            currentIndex = page;
                          });
                        },
                        controller: _pageController,
                        children: <Widget>[

                          makePage(
                              image: 'assets/images/introduction/task.png',
                              title: 'Best place to find jobs',
                              content: 'The best app for people from any background to find jobs in restaurents, manufacturing sector  etc and the ideal solution for keeping track of your schedule  '
                          ),
                          makePage(
                              image: 'assets/images/introduction/online-community.png',
                              title: '24x7 Customer Service',
                              content: ' 24x7 customer service and fast responses to your job application, because we know that you deserves the best'
                          ),
                          makePage(
                              image: 'assets/images/introduction/chat.png',
                              title: 'ChatRoom',
                              content: 'Chatroom that connects employer and  the employee in seconds '
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(

                    flex:1,
                    child:Container(
                        width: ScreenUtil().setWidth(double.infinity),
                        height: ScreenUtil().setHeight(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildIndicator(),
                        )
                    ),
                  ),
                  InkWell(

                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){(currentIndex != 2) ?

                    _pageController.nextPage(duration: Duration(milliseconds:
                    800), curve: Curves.easeInOut):
                    Navigator.pushNamed(context, Routes.authLogin);

                    },
                    child: AnimatedContainer(
                        margin: EdgeInsets.only(bottom: ScreenUtil().setHeight
                          (20),top:ScreenUtil().setHeight
                          (20)),
                        duration: Duration(milliseconds: 300),
                        height:ScreenUtil().setHeight
                          (50),
                        alignment: Alignment.center,
                        width: (currentIndex == 2) ? ScreenUtil().setWidth(200)
                            :ScreenUtil().setWidth(50),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: (currentIndex == 2) ? BorderRadius
                              .circular(10):BorderRadius.circular(40),
                        ),
                        child: (currentIndex == 2) ?
                        Text("Get Started",
                            style: Theme.of(context).textTheme.button
                        )
                            :Icon(Icons.navigate_next,
                          color: Colors.white,
                          size: 30,

                        )
                    ),
                  ),
                ]
            ),
          )
      ),
    );
  }


  Widget makePage(
      {String image, String title, String content, reverse = true}) {
    return Container(

      child: Column(
        children: <Widget>[

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),

              child: Image.asset(image
              ,height: ScreenUtil().setHeight(250),
                width:ScreenUtil().setHeight(300),)
          ),

          Text(
            title,
            textAlign: TextAlign.center,
            style:  Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 15,),

          SizedBox(
            width: 250.0,

            child: Text(
              content,
              textAlign: TextAlign.center,
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style:Theme.of(context).textTheme.bodyText2,

            ),
          ),


        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color:Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

}


