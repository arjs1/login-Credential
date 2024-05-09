import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logincredential/home/pages/homepage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> formKeyy = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswodController = TextEditingController();

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Text(
              "Get To The World",
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
              height: screenHeight * 0.05,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^[a-zA-Z ]*$'),
                    ),
                  ],
                  validator: (value) {
                    emptyValidation(value ?? "");
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.all(5),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                //email credential

                TextFormField(
                  controller: emailController,
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
                  height: screenHeight * 0.05,
                ),
                //Password credential
                TextFormField(
                  controller: passwordController,
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
                //reconfirm password credential
                TextFormField(
                  controller: repasswodController,
                  cursorColor: Colors.white,
                  validator: (value) {
                    emptyValidation(value);
                  },
                  obscureText: !isVisible ? true : false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
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
                //Sign Up button
                MaterialButton(
                  color: const Color.fromARGB(255, 7, 66, 168),
                  minWidth: screenWidth * 0.25,
                  height: 10,
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    if (nameController.text.isEmpty &&
                        emailController.text.isEmpty &&
                        passwordController.text.isEmpty &&
                        repasswodController.text.isEmpty &&
                        passwordController != repasswodController) {
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
              ],
            ))
          ],
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
