import 'package:flutter/material.dart';
import 'package:ivc/models/user_model.dart';
import 'package:ivc/screens/dashboard_screen.dart';
import 'package:ivc/screens/help_screen.dart';
import 'package:ivc/screens/subscription_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final PageController _pageController = PageController();
int _curentIndex = 0;
UserModel? user;

class _HomeScreenState extends State<HomeScreen> {
  void _getUserInfo()async{
    await UserModel.getUser();
    setState(() {
      user = UserModel.sessionUser;
    });
  }
  void _onTape(int value){
    setState(() {
      _curentIndex = value;
    });
    _pageController.jumpToPage(value);
  }
  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>SubscriptionScreen())
          );
        },
        child: Icon(Icons.person),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:"Accueil" ),
          BottomNavigationBarItem(icon: Icon(Icons.help), label:"Aide")
        ],
        onTap: _onTape,
        currentIndex: _curentIndex,
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            DashboardScreen(),
            HelpScreen()
          ],
          onPageChanged: (page){
            setState(() {
              _curentIndex = page;
            });
          },
        )
      ),
    );
  }
}