
import 'package:Quete/Utils/sizeConfiguration.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/Login.dart';

class onBoard extends StatefulWidget {
  static const routName ='/onboard-screen';
  @override
  _onBoardState createState() => _onBoardState();
}



class _onBoardState extends State<onBoard> {


  get mediaQuery => MediaQueryData.fromWindow(WidgetsBinding.instance.window);
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
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(

              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
              child:
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                 print(getProportionateScreenWidth(10.0, mediaQuery));
                  _pageController.jumpToPage(2);
                },
                child: Text('Skip', style: TextStyle(
                    color: (currentIndex == 2) ? Colors.white:Colors.black54,
                    fontSize: getProportionateScreenSize(15.0, mediaQuery),
                    fontFamily: 'Futura Book',
                    fontWeight: FontWeight.w600
                ),),

              )

            )
          ],
        ),
        body: Stack(
          
          alignment: Alignment.bottomCenter,

          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*.1, bottom:MediaQuery.of(context).size.height*.3  ),
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

                Container(
                margin: EdgeInsets.only(bottom: 150),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
                  )
                ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){(currentIndex == 2) ?
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),):
              _pageController.nextPage(duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
              },
              child: AnimatedContainer(
                  margin: EdgeInsets.only(bottom: 50),
                duration: Duration(milliseconds: 300),
                  height: 60,
                  alignment: Alignment.center,
                width: (currentIndex == 2) ? 200:60,
                decoration: BoxDecoration(
                  color: Color(0xFFa6e76c),
                  borderRadius: (currentIndex == 2) ? BorderRadius.circular(38):BorderRadius.circular(40),
                ),
                child: (currentIndex == 2) ?
                  Text("Get Started",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.w500,
                     fontFamily: 'Futura Heavy',
                   ),
                  )
                :Icon(Icons.navigate_next,
                  color: Colors.white,
                  size: 30,

                )
              ),
            ),
            SizedBox(height: 50,),




          ]
        )
      ),
    );
  }


  Widget makePage(
      {String image, String title, String content, reverse = true}) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),

            child: Image.asset(image, height: getProportionateScreenWidth(250.0, mediaQuery), width: getProportionateScreenWidth(250.0, mediaQuery),),
          ),
          SizedBox(height: 10,),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(52, 43, 37, 1),
              fontSize: getProportionateScreenSize(27, mediaQuery),
              fontWeight: FontWeight.bold,
              fontFamily: 'Futura Heavy',
            ),

          ),
          SizedBox(height: 15,),

          Text(
            content,
            textAlign: TextAlign.center,
            style:TextStyle(
                fontFamily: 'Futura Book',
                color: Colors.black.withOpacity(.5),
                fontSize: 18,
                fontWeight: FontWeight.w700),

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
          color: Color(0xFFa6e76c),
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


