import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pakk/models/user_model.dart';
import 'package:pakk/screens/my_service.dart';
import 'package:pakk/screens/register.dart';
import 'package:pakk/utility/my_alert.dart';
import 'package:pakk/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// field
  final formKey = GlobalKey<FormState>();
  String user, password;
  UserModel userModel;

// Method
  @override
  void initState() {
    super.initState();
    checkInternet();
  }

//  code open program check internet
  Future<void> checkInternet() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if ((result.isNotEmpty) && (result[0].rawAddress.isNotEmpty)) {
        print('Internet Connected');
      }
    } catch (e) {
      normalDialog(context, 'Internet Fail', 'Please Check Your Internet');
    }
  }

  Widget signInbutton() {
    return Expanded(
      child: RaisedButton(
        shape: MyStyle().curveButton,
        color: MyStyle().textColor,
        child: Text(
          'Sign in',
          style: MyStyle().myWhiteTextStyle,
        ),
        onPressed: () {
          formKey.currentState.save();
          print('user=$user,password=$password');
          checkAuthen();
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    if ((user.isEmpty) || (password.isEmpty)) {
      normalDialog(context, 'Have Space', 'Please fill all Every Blank');
    } else {
      // No Space
      String url =
          'https://www.androidthai.in.th/pint/getUserWhereUserPakk.php?isAdd=true&User=$user';
      Response response = await get(url);
      var result = jsonDecode(response.body);

      if (result.toString() == 'null') {
        normalDialog(context, 'User False', 'No $user in my Database');
      } else {
        for (var map in result) {
          print('map = $map');
          userModel = UserModel.fromAPI(map);

          print('password $password');
          print('True Passwird ${userModel.password}');

          // check password
          if (password == userModel.password) {
            print('password true');
            // move to Myservice
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) {
              return MyService(userModel: userModel,);
            });
            Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
                (Route<dynamic> route) {
              return false;
            });
          } else {
            normalDialog(context, 'Password False', 'Please Try Again');
          }
        }
      }
    }
  }

  Widget signUpbutton() {
    return Expanded(
      child: OutlineButton(
        shape: MyStyle().curveButton,
        borderSide: BorderSide(color: MyStyle().textColor),
        child: Text('Sign Up', style: TextStyle(color: MyStyle().textColor)),
        onPressed: () {
          print('You click Sign Up');

          // Create Route Arrow Back
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) {
            return Register();
          });
          Navigator.of(context).push(materialPageRoute);
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 200.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          signInbutton(),
          SizedBox(
            width: 4.0,
          ),
          signUpbutton(),
        ],
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 200.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'User:'),
        onSaved: (value) {
          user = value.trim();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 200.0,
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(labelText: 'Pass:'),
        onSaved: (value) {
          password = value.trim();
        },
      ),
    );
  }

  Widget showlogo() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Pakk Pipestate',
      style: TextStyle(
        fontSize: MyStyle().h1,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: MyStyle().textColor,
        fontFamily: 'Pattaya',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: MyStyle().myPadding,
            color: Color.fromARGB(5, 0, 0, 0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  showlogo(),
                  showAppName(),
                  userText(),
                  passwordText(),
                  showButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
