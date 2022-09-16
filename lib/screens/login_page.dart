import 'dart:convert';

import 'package:ecommerce/api_services/api_service.dart';
import 'package:ecommerce/screens/navbar_page.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isLoading = false;

  void initState() {
    isLogin();
    super.initState();
  }

  isLogin() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    print("Token is:  $token");

    if (token != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NavBar()));
    }
    setState(() {
      isLoading = false;
    });
  }

  getLogin() async {
    setState(() {
      isLoading = true;
    });
    var result_data = await ApiService()
        .loginUser(emailcontroller.text, passwordcontroller.text);
    setState(() {
      isLoading = false;
    });
    var data = jsonDecode(result_data);
    if (data["access_token"] != null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", data["access_token"]);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NavBar()));
    }
    print("responce is $data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        blur: 1,
        progressIndicator: CircularProgressIndicator(),
        child: Center(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Icon.png",
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width / 0.15,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                          if (!value.contains("@")) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        labelText: "Enter Your Email",
                        obscureText: false),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Password";
                        }
                        if (value.length < 3) {
                          return "Password is too short";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordcontroller,
                      labelText: "Enter Your Password",
                      obscureText: true,
                      isSuffix: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        getLogin();
                      },
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(40)),
                          child: const Center(
                              child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Doesn't have an Account?"),
                        TextButton(
                            onPressed: () {}, child: const Text("Sign up.")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
