import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void initState()
  {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Login',style: TextStyle(fontSize: 30),),
          centerTitle: true,

          backgroundColor: Colors.white10,

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                     hintStyle: TextStyle( color: Colors.white54),

                  ),
              
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Password',
                       hintStyle: TextStyle( color: Colors.white54),

                  ),
       
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  color: Colors.red[500],
                  
                  child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),),
                  onPressed: () async {
                    if(_formkey.currentState.validate()){

                      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                      if(result != null){

                        // pushReplacement
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }else{
                        print('user not found');
                      }
                    }
                  },
                ),
                RaisedButton(
                  color: Colors.red[500],
                  child: Text('Register New Account',style: TextStyle(fontSize: 20,color: Colors.white),),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen() ) );
                  },
                ),
          

              ],
            )
        ),
      ),
    );
  }



}