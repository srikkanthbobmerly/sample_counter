import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:git_sample/details_reports/form_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pattern = r'^.{8,}$';
  bool passwordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            backgroundColor: Colors.cyan,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 12,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'eQuadriga Visitors Log',
                                  style: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.account_circle,
                                  size: 100,
                                  color: Colors.black45,
                                )),
                            Container(
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: nameController,
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 14),
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty &&
                                      !RegExp('[0-9]').hasMatch(value)) {
                                    return "Please enter the UserName";
                                  } else if (value.length != 10) {
                                    return 'Please enter the valid username';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                obscureText: passwordVisible,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: passwordVisible
                                          ? Colors.grey
                                          : Colors.cyan,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter the Valid Password";
                                  } else if (value.length < 8) {
                                    return 'Password must be 8 digits';
                                  } else if (!RegExp(
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                      .hasMatch(value))
                                    return 'Required a Valid Password';
                                  return null;
                                },
                              ),
                            ),
                            Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                FormScreenPage(),
                                          ),
                                          (route) => false,
                                        );
                                      }
                                      ;
                                      print(nameController.text);
                                      print(passwordController.text);
                                    },
                                  ),
                                )),
//                    Row(
//                      children: <Widget>[F
//                        const Text('Does not have account?'),
//                        TextButton(
//                          child: const Text(
//                            'Sign up',
//                            style: TextStyle(fontSize: 20),
//                          ),
//                          onPressed: () {
//                            //signup screen
//                          },
//                        )
//                      ],
//                      mainAxisAlignment: MainAxisAlignment.center,
//                    ),
                            TextButton(
                              onPressed: () {
                                //forgot password screen
                              },
                              child: const Text(
                                'Forgot Password',
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            )));
  }
}
