import 'package:flutter/material.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {



  String _gender = "";
  bool _haveDog = false;
  double _feel = 0.0;
  String _favoriteNumber = "";

  String resultValue = "";

  ResultPage(String gender, bool haveDog, double feel, String favoriteNumber) {
    _gender = gender;
    _haveDog = haveDog;
    _feel = feel;
    _favoriteNumber = favoriteNumber;

    if(_haveDog) {
      resultValue = "daikichi!";
    }
    else {
      resultValue = result[Random().nextInt(result.length)];
    }
  }

  List<String> result = ["daikichi!", "chukichi!", "kichi!", "kyo!", "daikyo!!!"];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("the result is..."),
            Text(
              resultValue,
              style: TextStyle(
                color: Colors.red,
                fontSize: 60.0,
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("return to the page.")
            ),
            Text("gender"),
            Text(_gender),
            Text("whether have a dog"),
            Text("$_haveDog"),
            Text("feeling now"),
            Text("$_feel"),
            Text("favorite number"),
            Text("$_favoriteNumber"),
            // ignore: deprecated_member_use
          ],
        )
      )
    );
  }
}