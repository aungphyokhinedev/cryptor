import 'dart:html';

import 'package:clipboard/clipboard.dart';
import 'package:cryptor/common/AESHelper.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart';

class CryptPage extends StatefulWidget {
  @override
  _CryptPageState createState() => _CryptPageState();
}

class _CryptPageState extends State<CryptPage> {
  String _key;
  String _message;
  String _cipher;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Please enter a key'),
            onChanged: (text) {
              setState(() {
                _key = text;
              });
              print("First text field: $text");
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Please enter a message'),
            onChanged: (text) {
              print("First text field: $text");
              setState(() {
                _message = text;
              });
            },
          ),

          TextButton(
            onPressed: () {
              if (_message != null && _key != null) {
                setState(() {
                  _cipher = encryptAESCrypto(_message, _key);
                  print(_cipher);
                });
                FlutterClipboard.copy(_cipher).then((value) => print('copied'));
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Copied Cipher"),
                ));
              }
            },
            child: Text("CRYPT TEXT"),
          ),
          // if (_cipher != null) Text(_cipher),
        ],
      ),
    );
  }
}
