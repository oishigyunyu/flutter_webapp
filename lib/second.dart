import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("ネクストページ"),

      ),
      body: Center(
        child: Text(
          "次のページだよ",
          style: TextStyle(
            fontSize: 40.0
          )
        )
      )

    );
  }
}