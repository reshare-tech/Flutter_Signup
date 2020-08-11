import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterationPage(),
      routes: <String, WidgetBuilder> {
        "/Dashboard" : (context) => Dashboard()
      }
    );
  }
}

class RegisterationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override 
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("CREATE ACCOUNT"),
        centerTitle: true
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please enter your username";
                  } else if(value.length<2) {
                      return 'username should be greater than 2 characters';
                  } else
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter Username",
                  border: OutlineInputBorder(), 
                ),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                validator: (value){
                  if(value.isEmpty) {
                    return "Please enter your password";
                  } else
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30.0),
              RaisedButton(
                child: Text("Sign up"),
                color: Colors.blue,
                onPressed:() {
                  if(_formKey.currentState.validate()) {
                    //on btn click take us to wecome/dashbord page
                    Navigator.pushNamed(context, '/Dashboard');
                    print("your data is submitted");
                  }
                  //call the server to save information in database
                },
              )
            ]
          )
          )
      );
     
  }
  }

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),
      centerTitle: true
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Logout"),
          color: Colors.amber
        ),
         )
    );
  }

}