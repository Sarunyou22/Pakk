import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pakk/utility/my_style.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field
  final formKey = GlobalKey<FormState>();
  String name, user, password, dateString;

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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Name in the Blank';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          name = value.trim();
        },
      ),
    );
  }

  Widget userText() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
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
          hintText: 'YourEmail@email.com',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please fill Username';
          } else if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Keep Email Format';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          user = value.trim();
        },
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
          hintText: 'More 6 Charctor',
        ),
        validator: (value) {
          if (value.length < 6) {
            return 'Password More 6 Charactor';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          password = value.trim();
        },
      ),
    );
  }

  Widget showCurrentDate() {
    DateTime dateTime = DateTime.now();
    print('DateTime = $dateTime');

    dateString = DateFormat('yyyy-mm-dd').format(dateTime);
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
      onPressed: () {
        print('You Click Register');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $name, user = $user, password = $password');
          registerThread();
        }
      },
    );
  }

  Future<void> registerThread() async {
    String url ='https://www.androidthai.in.th/pint/addUserPakk.php?isAdd=true&Name=$name&User=$user&Password=$password&RegisDate=$dateString';
        
    Response response = await get(url);
    print('response = $response');
    var result = json.decode(response.body);
    print('result = $result');
    if (result.toString() == 'true') {
      Navigator.of(context).pop();
      
    } else {
    }
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
            colors: [Colors.white, Colors.white, MyStyle().mainColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: formKey,
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
      ),
    );
  }
}
