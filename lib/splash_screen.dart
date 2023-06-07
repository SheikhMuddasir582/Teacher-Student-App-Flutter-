import 'dart:async';

import 'package:chp_10/home_screen.dart';
import 'package:chp_10/login_screen.dart';
import 'package:chp_10/teacher_screen.dart';
import 'package:chp_10/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(seconds: 3), () {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => LoginScreen()));
    // });
    isLogin();
  }

  void isLogin() async
  {
    SharedPreferences sp= await SharedPreferences.getInstance();
    bool isLogin= sp.getBool('isLogin') ?? false;
    //cannot be null value
    String userType= sp.getString('userType')  ?? '';

    if(isLogin)
      {
        if(userType.contains('Student'))
        {
          Timer(Duration(seconds: 3), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentScreen()));
          });
        }
        else if( userType.contains('Teacher'))
        //userType == 'teacher')
          {
            Timer(Duration(seconds: 3), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeacherScreen()));
            });
          }
        else
          {
            Timer(Duration(seconds: 3), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeSreen()));
            });
          }
      }
    else
      {
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Image( height: double.infinity,
        fit: BoxFit.fitHeight,
      image: NetworkImage('https://images.pexels.com/photos/17111340/pexels-photo-17111340/free-photo-of-city-water-street-building.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
      ),
    );
  }
}
