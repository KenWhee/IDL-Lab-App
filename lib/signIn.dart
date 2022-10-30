import 'main.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  //const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool seePass = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignIn',
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(0.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BackgroundVideo()),
                );
              },
            ),
          ),
          title: Text('Sign In'),
        ),
        body: new Container(
          child: new Column(
            children: [
              new Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
              new Container(
                child: TextField(
                  obscureText: seePass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    suffix: IconButton(
                        onPressed: () {
                          setState(() { //refresh UI
                            if(seePass){ //if passenable == true, make it false
                              seePass = false;
                            }else{
                              seePass = true; //if passenable == false, make it true
                            }
                          });
                        }, icon: Icon(seePass == true?Icons.remove_red_eye:Icons.password)),
                  ),
                ),
              ),
              new Container (
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {

                    },
                    child: Text('Sign In'),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}