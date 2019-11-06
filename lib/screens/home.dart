import 'package:flutter/material.dart';
import 'package:pakk/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// field

// Method

  Widget signInbutton() {
    return Expanded(
      child: RaisedButton(
        shape: MyStyle().curveButton,
        color: MyStyle().textColor,
        child: Text(
          'Sign in',
          style: MyStyle().myWhiteTextStyle,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpbutton() {
    return Expanded(
      child: OutlineButton(
        shape: MyStyle().curveButton,
        borderSide: BorderSide(color: MyStyle().textColor),
        child: Text('Sign Up', style: TextStyle(color: MyStyle().textColor)),
        onPressed: () {},
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
        decoration: InputDecoration(labelText: 'User:'),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 200.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Pass:'),
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
          child: Container(padding: MyStyle().myPadding,
            color: Color.fromARGB(5, 0, 0, 0),
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
    ));
  }
}
