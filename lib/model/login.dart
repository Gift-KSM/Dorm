// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/model/screens/home_screen.dart';
import 'package:flutter_login/model/screens/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_login/model/data/profile.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  Profile profile = new Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(title: Text('Error')),
              body: Center(child: Text('${snapshot.error}')),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                backgroundColor: Color.fromARGB(255, 255, 219, 247),
                body: Center(
                    child: Form(
                  key: formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'DORM KUCSC',
                            style: TextStyle(
                                fontSize: 45, fontFamily: 'FC Orbit Rounded'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'To continue using this app',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'FC Orbit Rounded'),
                          ),
                          Text(
                            'Please Login first.',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'FC Orbit Rounded'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Image.asset('assets/img/Picture.png'),
                          SizedBox(
                            height: 20,
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   height: double.infinity,
                          //   decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //           image: AssetImage("assets/CSC/csc1.jpg"),
                          //           fit: BoxFit.cover)),
                          // ),
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Please enter your email'),
                                  EmailValidator(
                                      errorText: 'Invalid email format')
                                ]),
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (email) {
                                  profile.email = email;
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                ),
                                validator: RequiredValidator(
                                    errorText: 'Please enter your password'),
                                onSaved: (password) {
                                  profile.password = password;
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 238, 100, 146),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: profile.email.toString(),
                                            password:
                                                profile.password.toString())
                                        .then((value) {
                                      formKey.currentState!.reset();
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Screens();
                                      }));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    Fluttertoast.showToast(
                                        msg: e.message.toString());
                                  }
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: const Text(
                              "Didn't have any Account? Register now",
                              style: TextStyle(
                                  fontFamily: 'FC Orbit Rounded',
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )));
          }
          ;

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
