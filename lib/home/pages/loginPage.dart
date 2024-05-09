//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logincredential/home/pages/homepage.dart';
import 'package:logincredential/home/pages/signupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwodController = TextEditingController();

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.2,
              ),
              Text(
                "Enter The World",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 6.0,
                ),
              ),
              Divider(
                indent: screenWidth * 0.1,
                endIndent: screenWidth * 0.1,
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        emptyValidation(value ?? "");
                      },
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.all(5),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    TextFormField(
                      controller: passwodController,
                      cursorColor: Colors.white,
                      validator: (value) {
                        emptyValidation(value);
                      },
                      obscureText: !isVisible ? true : false,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            isVisible
                                // ignore: dead_code
                                ? Icons.remove_red_eye_sharp
                                : Icons.remove_red_eye_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(5),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    MaterialButton(
                      color: const Color.fromARGB(255, 7, 66, 168),
                      minWidth: screenWidth * 0.25,
                      height: 10,
                      padding: EdgeInsets.all(10.0),
                      onPressed: () {
                        if (nameController.text.isEmpty &&
                            passwodController.text.isEmpty) {
                          AlertDialog alert = AlertDialog(
                            content: const Text('Invalid Input Data'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        }
                      },
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Does not have account?",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 66, 168),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? emptyValidation(value) {
  if (value.isEmpty) {
    return "Value Cannot Be empty";
  } else if (value.length < 5) {
    return "field length must be greater than 5 char";
  }
  return null;
}
