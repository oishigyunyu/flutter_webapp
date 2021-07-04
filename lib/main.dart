import 'package:flutter/material.dart';
import 'package:hello_rectangle/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Noto Sans JP",
      ),
      home: DefaultTextStyle.merge(
          style: TextStyle(
              height: 1.5
          ),
          child: MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String genderAns = "男性";
  bool haveDog = false;
  late double feel;

  late TextEditingController favoriteNumberController;

  @override
  void initState() {
    super.initState();
    favoriteNumberController = new TextEditingController(text: "334");
    feel = 0.0;

  }

  @override
  void dispose() {
    favoriteNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 800.0,
                  height: 500.0,
                  margin: EdgeInsets.all(16.0),
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "運勢占い",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0
                      ),
                    ),
                  ),
                ),
                Text(
                  "質問1.　性別を教えてください",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("男性"),
                    Radio(
                      value: "男性",
                      groupValue: genderAns,
                      onChanged: (value) {
                        setState(() {
                          genderAns = value.toString();
                        });
                      },
                    ),
                    Text("女性"),
                    Radio(
                      value: "女性",
                      groupValue: genderAns,
                      onChanged: (value) {
                        setState(() {
                          genderAns = value.toString();
                        });
                      }
                    ),
                  ],
                ),
                Text(
                  "Do you have a dog?",
                  style: TextStyle(
                        fontSize: 30.0,
                    ),
                ),
                Switch(
                  value: haveDog,
                  onChanged: (value){
                    setState(() {
                      haveDog = value;
                    });
                  },
                ),
                Text("question 3. How do you feel now?",
                  style: TextStyle(
                    fontSize: 30.0,
                  )
                ),
                Text("${(feel * 100.0).round()}"),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("bad"),
                    Slider(
                      value: feel,
                      onChanged: (value) {
                        setState(() {
                          feel = value;
                        });
                      },
                    ),
                    Text("good"),
                  ],
                ),
                Text("question 4. What's your favorite color?",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Container(
                  width: 400.0,
                  child: TextField(
                    controller: favoriteNumberController,
                    textAlign: TextAlign.center,
                  )
                ),
                Text("question5. please check it below",
                  style: TextStyle(
                    fontSize: 30.0,

                  )
                ),
                Checkbox(
                  value: haveDog,
                  onChanged: (value){
                    setState(() {
                      haveDog = value!;
                    });
                  }
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) {
                              return ResultPage(genderAns, haveDog, feel, favoriteNumberController.text);
                            }
                        )
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    "watch the result.",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ]
            )
          )
        )
    );
  }
}