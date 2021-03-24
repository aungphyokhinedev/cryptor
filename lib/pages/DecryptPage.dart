import 'package:clipboard/clipboard.dart';
import 'package:cryptor/common/AESHelper.dart';
import 'package:flutter/material.dart';

class DecryptPage extends StatefulWidget {
  @override
  _DecryptPageState createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
  String _key;
  String _message;
  String _cipher;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
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
            decoration: InputDecoration(hintText: 'Please enter a cipher'),
            onChanged: (text) {
              setState(() {
                _cipher = text;
              });
              print("First text field: $text");
            },
          ),
          TextButton(
            onPressed: () {
              if (_cipher != null && _key != null) {
                setState(() {
                  _message = decryptAESCrypto(_cipher, _key);
                  print(_message);
                });
                FlutterClipboard.copy(_message)
                    .then((value) => print('copied'));
              }
            },
            child: Text("DECRYPT TEXT"),
          ),
          if (_message != null) Text(_message),
        ],
      ),
    ));
  }
}
