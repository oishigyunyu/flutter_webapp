import 'package:flutter/material.dart';
import 'package:hello_rectangle/second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController nameController; ////////////追加！
  late TextEditingController passwordController; ////////////追加！

  String name = "";
  String password = "";

  @override ///////////////////////////////////////////追加！
  void initState() {
    super.initState();

    nameController = new TextEditingController();
    passwordController = new TextEditingController();

  }

  @override
  void dispose() {////////////////////////////////////////追加！
    nameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  "image/pien.jpg",
                  width: 100,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.green,
                ),
                Container(
                  width: 200,
                  child: TextField(
                    controller: nameController,
                    onChanged: (text){
                      setState(() {
                        name = text;
                      });
                    },
                  ),
                ),
                Text(
                    "ようこそ、$nameさん",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey
                    )
                ),
                Container(
                  width: 200,
                  child: TextField(
                    controller: passwordController,
                    onChanged: (text){
                      setState(() {
                        password = text;
                      });
                    },
                  ),
                ),
                Text(
                    "パスワードを入力",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey
                    )
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    if(name == password) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SecondPage();
                          },
                        ),
                      );
                    }

                    else{
                      print("パスワードが違います");
                    }
                  },
                  child: Text("ログイン"),
                ),
              ],
            ),
          )
        )
    );
  }
}