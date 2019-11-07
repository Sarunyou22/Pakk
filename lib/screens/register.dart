import 'package:flutter/material.dart';
import 'package:pakk/utility/my_style.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field

  // Method
  Widget nameText() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.folder_open,
            size: 36.0,
            color: Colors.greenAccent,
          ),
          labelText: 'Display Name',
          labelStyle: TextStyle(color: Colors.indigo),
          helperText: 'Type You First Name',
          helperStyle: TextStyle(color: Colors.lightBlueAccent),
          hintText: 'English Only',
        ),
      ),
    );
  }

  Widget userText() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.account_box,
            size: 36.0,
            color: Colors.cyanAccent,
          ),
          labelText: 'User',
          labelStyle: TextStyle(color: Colors.cyanAccent),
          helperText: 'Type You User',
          helperStyle: TextStyle(color: Colors.cyanAccent),
          hintText: 'English Only',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.greenAccent,
          ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.yellow),
          helperText: 'Type You Password',
          helperStyle: TextStyle(color: Colors.yellowAccent),
          hintText: 'English Only',
        ),
      ),
    );
  }

  Widget showCurrentDate() {
    DateTime dateTime = DateTime.now();
    print('DateTime = $dateTime');

    String dateString = DateFormat('yyyy-mm-dd').format(dateTime);
    print('DateTime = $dateString');

    return Text(
      'Date = $dateString',
      style: MyStyle().myTextStyleH2,
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'Upload Now',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().textColor,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellowAccent[100], MyStyle().mainColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            showCurrentDate(),
            SizedBox(
              height: 20.0,
            ),
            nameText(),
            userText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
