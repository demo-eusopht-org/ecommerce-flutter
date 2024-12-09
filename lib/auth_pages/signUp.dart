import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping/MainScreens/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController namecontroller = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SignUpState extends State<SignUp> {
  late bool _isLoading = false;
  var _formKey = GlobalKey<FormState>();

  void initState() {
    emailcontroller.clear();
    passwordcontroller.clear();
    confirmPasswordController.clear();
    namecontroller.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/7.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // IconButton(
                        //   icon: Icon(Icons.arrow_back_ios_new_outlined,
                        //       color: Color.fromARGB(255, 2, 133, 100)),
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => SignIn()));
                        //   },
                        // ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Name:',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextFormField(
                                                  controller: namecontroller,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    hintText: "Enter Your Name",
                                                    hintStyle: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      value =
                                                          namecontroller.text;
                                                    });
                                                  },
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Name Must Be Written';
                                                    }
                                                  }),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Email:',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextFormField(
                                                controller: emailcontroller,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  hintText: "Enter Your Email",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty ||
                                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                          .hasMatch(value)) {
                                                    return 'Enter a valid email!';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'Password:',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextFormField(
                                                  controller:
                                                      passwordcontroller,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Enter Your Password",
                                                    hintStyle: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      value = passwordcontroller
                                                          .text;
                                                    });
                                                  },
                                                  obscureText: true,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Enter a valid password!';
                                                    }
                                                  }),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Confirm Password:',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextFormField(
                                                  controller:
                                                      confirmPasswordController,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Confirm Password",
                                                    hintStyle: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      value =
                                                          confirmPasswordController
                                                              .text;
                                                    });
                                                  },
                                                  obscureText: true,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Enter a valid password!';
                                                    }
                                                  }),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    10,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.07,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    backgroundColor: Colors
                                                        .white, // Background color
                                                  ),
                                                  onPressed: () async {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      try {
                                                        await FirebaseAuth
                                                            .instance
                                                            .createUserWithEmailAndPassword(
                                                          email: emailcontroller
                                                              .text
                                                              .trim(),
                                                          password:
                                                              passwordcontroller
                                                                  .text
                                                                  .trim(),
                                                        )
                                                            .then(
                                                                (signedInUser) {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'users')
                                                              .add({
                                                            'name':
                                                                namecontroller
                                                                    .text,
                                                            'email':
                                                                emailcontroller
                                                                    .text,
                                                            'uid': FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid,
                                                            // 'pass': passwordcontroller.text,
                                                          }).then((value) {
                                                            if (signedInUser !=
                                                                null) {
                                                              Navigator
                                                                  .pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          HomePage(),
                                                                ),
                                                              );
                                                              emailcontroller
                                                                  .clear();
                                                              passwordcontroller
                                                                  .clear();
                                                              namecontroller
                                                                  .clear();
                                                              confirmPasswordController
                                                                  .clear();
                                                            }
                                                          });
                                                        });
                                                      } on FirebaseAuthException catch (error) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'First Complete All the Fields'),
                                                          ),
                                                        );
                                                      }
                                                    }
                                                  },
                                                  child: Text(
                                                    'SignUp',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ))
                                ])),
                      ])))),
    );
  }
}
