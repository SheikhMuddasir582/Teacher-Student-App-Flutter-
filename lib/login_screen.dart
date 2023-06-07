import 'package:chp_10/home_screen.dart';
import 'package:chp_10/teacher_screen.dart';
import 'package:chp_10/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const List<String> list = <String>['Teacher', 'Student'];
  String dropdownValue = list.first;
  final emailControl= TextEditingController();
  final passwordControl= TextEditingController();
  final ageControl= TextEditingController();
  //SharedPreferences pref;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailControl,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordControl,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: ageControl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Age',
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.bottomLeft,
              child: DropdownButton<String>(
                hint: Text('Select Type'),
                value: dropdownValue,
                onChanged: (String? newValue) async
                {
                  setState(() {
                    dropdownValue= newValue!;
                  });
                  //pref.setString('userType', dropdownValue);
                  SharedPreferences sp= await SharedPreferences.getInstance();
                  //dropdownValue= sp.getString('userType') ?? '';
                  sp.setString('userType', dropdownValue);
                },
                items: list.map<DropdownMenuItem<String>>((String fValue) {
                  return DropdownMenuItem<String>(
                    value: fValue,
                    child: Text(fValue),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () async
              {
                // print('tap');
                SharedPreferences sp=  await SharedPreferences.getInstance();
                //pref= await SharedPreferences.getInstance();
                sp.setString('email', emailControl.text.toString());
                sp.setString('age', ageControl.text.toString());
                //dropdownValue= pref.getString('userType') ?? '';
                //sp.getString('userType' ?? '');
                //dropdownValue= sp.getString('userType') ?? '';
                //sp.setString('userType', dropdownValue);
                //sp.setString('userType', dropdownValue);
                sp.setBool('isLogin', true);
                if(dropdownValue.contains('Teacher') )
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TeacherScreen()));
                  }
                else if( dropdownValue.contains('Student'))
                //sp.getString('userType') == 'Student' )
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentScreen()));
                  }
                else
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeSreen()));
                  }


               // print(sp.getString('name'));
                //hello();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(child: Text('Sign up')),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> hello() async
  // {
  //   await Future.delayed(Duration(seconds: 3));
  //   print('delay');
  // }


  // read() async
  // {
  //   pref=await SharedPreferences.getInstance();
  // }
}

