import 'package:flutter/material.dart';
import 'package:pakk/utility/my_style.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // Field
  String codeString = '';

  // Method
  Widget readButton() {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: RaisedButton.icon(
                icon: Icon(Icons.photo_camera),
                label: Text('Read QR or Bar Code'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget codeReaded() {
    return Center(
        child: Text(
      'Code Readed $codeString',
      style: TextStyle(color: MyStyle().textColor, fontSize: MyStyle().h2),
    ));
  }

  Widget headTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Read QR or Bar Code',
          style: TextStyle(fontSize: MyStyle().h1),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          headTitle(),
          codeReaded(),
          readButton(),
        ],
      ),
    );
  }
}
