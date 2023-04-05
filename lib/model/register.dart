// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_login/model/login.dart';
import 'package:flutter_login/model/data/profile.dart';
import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
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
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leadingWidth: 100,
                leading: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text(
                    'Back',
                    style:
                        TextStyle(fontFamily: 'FC Orbit Rounded', fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color.fromARGB(255, 238, 100, 146),
                  ),
                ),
                backgroundColor: Color.fromARGB(255, 238, 100, 146),
              ),
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
                          const Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 50, fontFamily: 'FC Orbit Rounded'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Please complete your',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'FC Orbit Rounded'),
                          ),
                          const Text(
                            'data correctly',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'FC Orbit Rounded'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/img/register.png',
                            height: 200,
                            width: 300,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Create your Email',
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Your Email'),
                                EmailValidator(
                                    errorText: 'Invalid email format')
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (email) {
                                profile.email = email;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Create your Password',
                                ),
                                validator: RequiredValidator(
                                    errorText: 'Please enter your password.'),
                                onSaved: (password) {
                                  profile.password = password;
                                }),
                          ),
                          const SizedBox(
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
                                        .createUserWithEmailAndPassword(
                                            email: profile.email.toString(),
                                            password:
                                                profile.password.toString())
                                        .then((value) {
                                      formKey.currentState!.reset();
                                      Fluttertoast.showToast(
                                          msg: 'Account Created Successfully');
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return login();
                                      }));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    String message;
                                    if (e.code == 'email-already-in-use') {
                                      message =
                                          'Duplicate emails are not available.';
                                    } else if (e.code == 'weak-password') {
                                      message =
                                          'Password must be 6 or more characters long.';
                                    } else {
                                      message = e.message.toString();
                                    }

                                    Fluttertoast.showToast(msg: message);
                                  }
                                }
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'FC Orbit Rounded',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
          ;
        });
  }
}
