import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/screens/Register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _email;
  String _password;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Please fill the fields!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Covid-19'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },

              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/covid.png"),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email), hintText: 'email'),
                  onChanged: (value) {
                    _email = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock), hintText: 'password'),
                  onChanged: (value) {
                    _password = value;
                  },
                  obscureText: true,
                ),
                ElevatedButton(
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    _login();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
